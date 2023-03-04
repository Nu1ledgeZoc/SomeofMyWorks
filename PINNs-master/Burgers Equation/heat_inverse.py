import sys
sys.path.insert(0, '../Utilities/')

import torch
from collections import OrderedDict

import deepxde as dde
import numpy as np
import matplotlib.pyplot as plt
import scipy.io
from scipy.interpolate import griddata
from plotting import newfig, savefig
from mpl_toolkits.axes_grid1 import make_axes_locatable
import matplotlib.gridspec as gridspec
import warnings

warnings.filterwarnings('ignore')

np.random.seed(1234)

# parameter setting
Tair = 15
bx = 1
ET = 0.00022

# CUDA support
if torch.cuda.is_available():
    device = torch.device('cuda')
else:
    device = torch.device('cpu')


# the deep neural network
class DNN(torch.nn.Module):
    def __init__(self, layers):
        super(DNN, self).__init__()

        # parameters
        self.depth = len(layers) - 1

        # set up layer order dict
        self.activation = torch.nn.Tanh

        layer_list = list()
        for i in range(self.depth - 1):
            layer_list.append(
                ('layer_%d' % i, torch.nn.Linear(layers[i], layers[i + 1]))
            )
            layer_list.append(('activation_%d' % i, self.activation()))

        layer_list.append(
            ('layer_%d' % (self.depth - 1), torch.nn.Linear(layers[-2], layers[-1]))
        )
        layerDict = OrderedDict(layer_list)

        # deploy layers
        self.layers = torch.nn.Sequential(layerDict)

    def forward(self, x):
        out = self.layers(x)
        return out


# the physics-guided neural network
class PhysicsInformedNN():
    def __init__(self, X_u, u, X_f, layers, lb, ub):
        # boundary conditions
        self.lb = torch.tensor(lb).float().to(device)
        self.ub = torch.tensor(ub).float().to(device)

        # data
        self.x = torch.tensor(X_u[:, 0:1], requires_grad=True).float().to(device)
        self.t = torch.tensor(X_u[:, 1:2], requires_grad=True).float().to(device)
        self.i = torch.tensor(X_u[:, 2:3], requires_grad=True).float().to(device)
        self.v = torch.tensor(X_u[:, 3:4], requires_grad=True).float().to(device)
        self.x = torch.tensor(X_f[:, 0:1], requires_grad=True).float().to(device)
        self.t = torch.tensor(X_f[:, 1:2], requires_grad=True).float().to(device)
        self.i = torch.tensor(X_f[:, 2:3], requires_grad=True).float().to(device)
        self.v = torch.tensor(X_f[:, 3:4], requires_grad=True).float().to(device)
        self.u = torch.tensor(u).float().to(device)

        # settings
        self.rohCp = torch.tensor([30.9], requires_grad=True).to(device)
        self.Kx = torch.tensor([0.8], requires_grad=True).to(device)
        self.hc = torch.tensor([0.12], requires_grad=True).to(device)

        self.rohCp = torch.nn.Parameter(self.rohCp)
        self.Kx = torch.nn.Parameter(self.Kx)
        self.hc = torch.nn.Parameter(self.hc)

        # deep neural networks
        self.dnn = DNN(layers).to(device)
        self.dnn.register_parameter('rohCp', self.rohCp)
        self.dnn.register_parameter('Kx', self.Kx)
        self.dnn.register_parameter('hc', self.hc)

        # optimizers: using the same settings
        self.optimizer = torch.optim.LBFGS(
            self.dnn.parameters(),
            lr=1.0,
            max_iter=50000,
            max_eval=50000,
            history_size=50,
            tolerance_grad=1e-5,
            tolerance_change=1.0 * np.finfo(float).eps,
            line_search_fn="strong_wolfe"  # can be "strong_wolfe"
        )

        self.optimizer_Adam = torch.optim.Adam(self.dnn.parameters())
        self.iter = 0

    def net_u(self, x, t, i, v):
        u = self.dnn(torch.cat([x, t, i, v], dim=1))
        return u

    def boundary_condition_l(self, x, t, i, v):
        Kx = self.Kx
        hc = self.hc
        u = self.net_u(x, t, i, v)
        u_x = torch.autograd.grad(
            u, x,
            grad_outputs=torch.ones_like(u),
            retain_graph=True,
            create_graph=True
        )[0]
        bc_l = -Kx * u_x + hc * (u - Tair)
        return bc_l

    def boundary_condition_r(self, x, t, i, v):
        Kx = self.Kx
        hc = self.hc
        u = self.net_u(x, t, i, v)
        u_x = torch.autograd.grad(
            u, x,
            grad_outputs=torch.ones_like(u),
            retain_graph=True,
            create_graph=True
        )[0]
        bc_r = -Kx * u_x - hc * (u - Tair)
        return bc_r

    def net_f(self, x, t, i, v):
        """ The pytorch autograd version of calculating residual """
        rohCp = self.rohCp
        Kx = self.Kx
        hc = self.hc
        u = self.net_u(x, t, i, v)

        u_t = torch.autograd.grad(
            u, t,
            grad_outputs=torch.ones_like(u),
            retain_graph=True,
            create_graph=True
        )[0]
        u_x = torch.autograd.grad(
            u, x,
            grad_outputs=torch.ones_like(u),
            retain_graph=True,
            create_graph=True
        )[0]
        u_xx = torch.autograd.grad(
            u_x, x,
            grad_outputs=torch.ones_like(u_x),
            retain_graph=True,
            create_graph=True
        )[0]

        f = rohCp * u_t - Kx * u_xx - bx * i * (v - ET * u) - hc * (u - Tair)
        return f

    def loss_func(self):
        self.optimizer.zero_grad()

        u_pred = self.net_u(self.x, self.t, self.i, self.v)
        f_pred = self.net_f(self.x, self.t, self.i, self.v)
        bc_l = self.boundary_condition_l(self.x, self.t, self.i, self.v)
        bc_r = self.boundary_condition_r(self.x, self.t, self.i, self.v)
        loss_u = torch.mean((self.u - u_pred) ** 2)
        loss_f = torch.mean(f_pred ** 2) + torch.mean(bc_l ** 2) + torch.mean(bc_r ** 2)
        loss = loss_u + loss_f
        loss.backward()

        self.iter += 1
        if self.iter % 100 == 0:
            print(
                'Loss: %e, l1: %.5f, l2: %.5f, l3: %.5f' %
                (
                    loss.item(),
                    self.rohCp.item(),
                    self.Kx.item(),
                    self.hc.item(),
                )
            )
        return loss

    def train(self, nIter):
        self.dnn.train()
        for epoch in range(nIter):
            u_pred = self.net_u(self.x, self.t, self.i, self.v)
            f_pred = self.net_f(self.x, self.t, self.i, self.v)
            loss = torch.mean((self.u - u_pred) ** 2) + torch.mean(f_pred ** 2)

            # Backward and optimize
            self.optimizer_Adam.zero_grad()
            loss.backward()
            self.optimizer_Adam.step()

            if epoch % 100 == 0:
                print(
                    'It: %d, Loss: %.3e, rohCp: %.3f, Kx: %.6f, hc: %.6f' %
                    (
                        epoch,
                        loss.item(),
                        self.rohCp.item(),
                        self.Kx.item(),
                        self.hc.item(),
                    )
                )

        # Backward and optimize
        self.optimizer.step(self.loss_func)

    def predict(self, X):
        x = torch.tensor(X[:, 0:1], requires_grad=True).float().to(device)
        t = torch.tensor(X[:, 1:2], requires_grad=True).float().to(device)
        i = torch.tensor(X[:, 2:3], requires_grad=True).float().to(device)
        v = torch.tensor(X[:, 3:4], requires_grad=True).float().to(device)

        self.dnn.eval()
        u = self.net_u(x, t, i, v)
        f = self.net_f(x, t, i, v)
        u = u.detach().cpu().numpy()
        f = f.detach().cpu().numpy()
        return u, f

## Configurations

nu = 0.01/np.pi

N_u = 20000
layers = [4, 20, 20, 20, 20, 20, 20, 20, 20, 1]

# data = scipy.io.loadmat('data/I-E-Eoc-T.mat')

x_dim, t_dim = (20, 2400)
# Bounds of 'x' and 't':
x_min, t_min = (0, 0.)
x_max, t_max = (6.5, 2400.)

# Create tensors:
t = np.linspace(t_min, t_max, num=t_dim).reshape(t_dim, 1)
x = np.linspace(x_min, x_max, num=x_dim).reshape(x_dim, 1)
data = np.load("C:/Users/ASUS/Desktop/Work/Battery modeling/PINNs/deepxde-master/examples/heat_demo/I-E-Eoc-T.npz")
e, eoc, i, h = data["arr_0"], data["arr_1"], data["arr_2"], data["arr_3"]
v = e - eoc
v = v.flatten()[:,None]
i = i.flatten()[:,None]
Exact = np.real(data['arr_3']).T

xxv, V = np.meshgrid(x, v)
xxi, I = np.meshgrid(x, i)
X, T = np.meshgrid(x, t)

X_star = np.hstack((X.flatten()[:, None], T.flatten()[:, None], I.flatten()[:, None], V.flatten()[:, None]))
u_star = Exact.flatten()[:, None]

# Doman bounds
lb = X_star.min(0)
ub = X_star.max(0)

# create training set
idx = np.random.choice(X_star.shape[0], N_u, replace=False)
X_u_train = X_star[idx, :]
u_train = u_star[idx, :]

# training
model = PhysicsInformedNN(X_u_train, u_train, X_f_train, layers, lb, ub)
model.train(1000)

# evaluations
u_pred, f_pred = model.predict(X_star)

error_u = np.linalg.norm(u_star-u_pred, 2)/np.linalg.norm(u_star, 2)
print('Error u: %e' % error_u)

"""U_pred = griddata(X_star, u_pred.flatten(), (X, T, I, V), method='nearest')
Error = np.abs(Exact - U_pred)
print('Error : %e' % Error)"""

rohCp_value = model.rohCp.detach().cpu().numpy()
Kx_value = model.Kx.detach().cpu().numpy()
hc_value = model.hc.detach().cpu().numpy()

error_rohCp = np.abs(rohCp_value - 30.9) * 100
error_Kx = np.abs(Kx_value - 0.8) * 100
error_hc = np.abs(hc_value - 0.12) * 100
print('Error rohCp: %.5f%%' % error_rohCp)
print('Error Kx: %.5f%%' % error_Kx)
print('Error hc: %.5f%%' % error_hc)

loss = PhysicsInformedNN(X_star, u_star, layers, lb, ub).loss_func()
print('PINN_loss: %e' % loss)


# plot loss
""" The aesthetic setting has changed. """

fig = plt.figure(figsize=(14, 10))
ax = fig.add_subplot(111)

gs1 = gridspec.GridSpec(1, 3)
gs1.update(top=1-1.0/3.0-0.1, bottom=1.0-2.0/3.0, left=0.1, right=0.9, wspace=0.5)

ax = plt.subplot(gs1[0, 0])
ax.plot(x,Exact[25, :], 'b-', linewidth=2, label='Exact')
ax.plot(x,U_pred[25, :], 'r--', linewidth=2, label='Prediction')
ax.set_xlabel('$x$')
ax.set_ylabel('$u(t,x)$')
ax.set_title('$t = 0.25$', fontsize=15)
ax.axis('square')
ax.set_xlim([-0.1, 7.1])
ax.set_ylim([14, 60])

for item in ([ax.title, ax.xaxis.label, ax.yaxis.label] +
             ax.get_xticklabels() + ax.get_yticklabels()):
    item.set_fontsize(15)

ax = plt.subplot(gs1[0, 1])
ax.plot(x,Exact[50, :], 'b-', linewidth = 2, label = 'Exact')
ax.plot(x,U_pred[50, :], 'r--', linewidth = 2, label = 'Prediction')
ax.set_xlabel('$x$')
ax.set_ylabel('$u(t,x)$')
ax.axis('square')
ax.set_xlim([-1.1,1.1])
ax.set_ylim([-1.1,1.1])
ax.set_title('$t = 0.50$', fontsize = 15)
ax.legend(
    loc='upper center',
    bbox_to_anchor=(0.5, -0.15),
    ncol=5,
    frameon=False,
    prop={'size': 15}
)

for item in ([ax.title, ax.xaxis.label, ax.yaxis.label] +
             ax.get_xticklabels() + ax.get_yticklabels()):
    item.set_fontsize(15)

ax = plt.subplot(gs1[0, 2])
ax.plot(x,Exact[75,:], 'b-', linewidth = 2, label = 'Exact')
ax.plot(x,U_pred[75,:], 'r--', linewidth = 2, label = 'Prediction')
ax.set_xlabel('$x$')
ax.set_ylabel('$u(t,x)$')
ax.axis('square')
ax.set_xlim([-1.1,1.1])
ax.set_ylim([-1.1,1.1])
ax.set_title('$t = 0.75$', fontsize = 15)

for item in ([ax.title, ax.xaxis.label, ax.yaxis.label] +
             ax.get_xticklabels() + ax.get_yticklabels()):
    item.set_fontsize(15)

plt.show()



Loss_list = []
Loss_list.append(PhysicsInformedNN(X_star, u_star, layers, lb, ub).loss_func() / 48000)
# Accuracy_list.append(100 * train_acc / (len(train_dataset)))
#我这里迭代了200次，所以x的取值范围为(0，200)，然后再将每次相对应的准确率以及损失率附在x上
x1 = range(0, 6000)
y1 = Loss_list
plt.plot(x1, y1, '.-')
plt.title('Test loss vs. epoch')
plt.xlabel('epoch')
plt.ylabel('Test loss')
plt.show()
plt.savefig("loss.jpg")