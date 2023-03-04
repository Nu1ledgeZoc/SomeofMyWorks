import sys
sys.path.insert(0, '../Utilities/')

import torch
from collections import OrderedDict
import numpy as np
import matplotlib.pyplot as plt
import scipy.io
from scipy.interpolate import griddata
from plotting import newfig, savefig
from mpl_toolkits.axes_grid1 import make_axes_locatable
from mpl_toolkits.mplot3d import Axes3D
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
    def __init__(self, X, u, layers, bc, ic):
        # boundary conditions
        self.bc = torch.tensor(bc).float().to(device)
        self.ic = torch.tensor(ic).float().to(device)

        # data
        self.x = torch.tensor(X[:, 0:1], requires_grad=True).float().to(device)
        self.t = torch.tensor(X[:, 1:2], requires_grad=True).float().to(device)
        self.i = torch.tensor(X[:, 2:3], requires_grad=True).float().to(device)
        self.v = torch.tensor(X[:, 3:4], requires_grad=True).float().to(device)
        self.u = torch.tensor(u).float().to(device)
        # self.u_bc_l = torch.tensor(u).float().to(device)
        # self.u_bc_r = torch.tensor(u).float().to(device)

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

    def net_bc(self, x, t, i, v):
        Kx = self.Kx
        hc = self.hc
        # xbc = torch.zeros(48000, 1)
        u_bc = self.dnn(torch.cat([x, t, i, v], dim=1))
        u_bc_x = torch.autograd.grad(
            u_bc, x,
            grad_outputs=torch.ones_like(u_bc),
            retain_graph=True,
            create_graph=True
        )[0]

        x = x.detach()
        i = i.detach()
        mask_x_0 = x
        mask_x_0[x == 0] = 1
        mask_x_0[x != 0] = 0

        mask_x_65 = x
        mask_x_65[x == 6.5] = 1
        mask_x_65[x != 6.5] = 0

        mask_i_0 = i
        mask_i_0[i == 0] = 1
        mask_i_0[i != 0] = 0

        bc_l = mask_x_0 * (-Kx * u_bc_x + hc * (u_bc - Tair))
        bc_r = mask_x_65 * (-Kx * u_bc_x - hc * (u_bc - Tair))
        ic_t = mask_i_0 * (u_bc - 15)
        # bc_l = -Kx * u_bc_x + hc * (u_bc - Tair)
        # bc_r = -Kx * u_bc_x - hc * (u_bc - Tair)
        loss_bc_ic = bc_l + bc_r + ic_t
        return loss_bc_ic
        #
        # if np.isclose(x, 0) is True:
        #     bc_l = -Kx * u_bc_x + hc * (u_bc - Tair)
        #     return bc_l
        # if x[i][0] == 6.5:
        #     bc_r = -Kx * u_bc_x - hc * (u_bc - Tair)
        #     return bc_r
        # else:
        #     return None

    # def boundary_condition_l(self, x, t, i, v):
    #     Kx = self.Kx
    #     hc = self.hc
    #     u = self.net_u(x, t, i, v)
    #     u_x = torch.autograd.grad(
    #         u, x,
    #         grad_outputs=torch.ones_like(u),
    #         retain_graph=True,
    #         create_graph=True
    #     )[0]
    #     bc_l = -Kx * u_x + hc * (u - Tair)
    #     return bc_l
    #
    # def boundary_condition_r(self, x, t, i, v):
    #     Kx = self.Kx
    #     hc = self.hc
    #     u = self.net_u(x, t, i, v)
    #     u_x = torch.autograd.grad(
    #         u, x,
    #         grad_outputs=torch.ones_like(u),
    #         retain_graph=True,
    #         create_graph=True
    #     )[0]
    #     bc_r = -Kx * u_x - hc * (u - Tair)
    #     return bc_r

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
        f = rohCp * u_t - Kx * u_xx - bx * i * (v - ET * u)
        return f

    def x_bc_l(self):
        x = torch.zeros(48000, 1)
        t = torch.linspace(0, 2400, 48000).unsqueeze(1)
        i = torch.sin(t).to(device)
        v = torch.sin(t).to(device)
        cond = torch.zeros(48000, 1)
        return x.requires_grad_(True), t.requires_grad_(True), i.requires_grad_(True), v.requires_grad_(True), cond

    def loss_bc_l(self):
        x, t, i, v, cond = self.x_bc_l()
        Kx = self.Kx
        hc = self.hc
        u_bc_l = self.dnn(torch.cat([x, t, i, v], dim=1))
        u_bc_l_x = torch.autograd.grad(
            u_bc_0_x, x,
            grad_outputs=torch.ones_like(u),
            retain_graph=True,
            create_graph=True
        )[0]
        bc_l = -Kx * u_bc_l_x + hc * (u_bc_l - Tair)
        return bc_l

    def x_bc_r(self):
        x = torch.ones(48000, 1).to(device) * 6.5
        t = torch.linspace(0, 2400, 48000).unsqueeze(1)
        i = torch.sin(t).to(device)
        v = torch.sin(t).to(device)
        cond = torch.zeros(48000, 1)
        return x.requires_grad_(True), t.requires_grad_(True), i.requires_grad_(True), v.requires_grad_(True), cond

    def loss_bc_r(self):
        x, t, i, v, cond = self.x_bc_r()
        Kx = self.Kx
        hc = self.hc
        u_bc_r = self.dnn(torch.cat([x, t, i, v], dim=1))
        u_bc_r_x = torch.autograd.grad(
            u_bc_0_x, x,
            grad_outputs=torch.ones_like(u),
            retain_graph=True,
            create_graph=True
        )[0]
        bc_r = -Kx * u_bc_r_x - hc * (u_bc_r - Tair)
        return bc_r

    def loss_func(self):
        u_pred = self.net_u(self.x, self.t, self.i, self.v)
        f_pred = self.net_f(self.x, self.t, self.i, self.v)
        # bc_l = self.loss_bc_l()
        # bc_r = self.loss_bc_r()
        # bc_l = self.boundary_condition_l(self.x, self.t, self.i, self.v)
        # bc_r = self.boundary_condition_r(self.x, self.t, self.i, self.v)
        bc = self.net_bc(self.x, self.t, self.i, self.v)
        # if bc is None:
        #     loss_bc = 0
        # else:
        loss_bc = np.linalg.norm(bc)
        # loss_bc = torch.mean((self.u - u_bc_0) ** 2) + torch.mean((self.u - u_bc_x) ** 2)
        loss_u = torch.mean((self.u - u_pred) ** 2)
        loss_f = torch.mean(f_pred ** 2)
        loss = loss_u * u_weight + loss_f * f_weight + loss_bc * bc_weight  # nn.functional.normalize
        # running_loss = loss.item()
        self.optimizer.zero_grad()
        loss.backward()

        self.iter += 1
        if self.iter % 100 == 0:
            print(
                'Loss: %e, rohCp: %.3f, Kx: %.6f, hc: %.6f' %
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
            # bc_l = self.loss_bc_l()
            # bc_r = self.loss_bc_r()
            # bc_l = self.boundary_condition_l(self.x, self.t, self.i, self.v)
            # bc_r = self.boundary_condition_r(self.x, self.t, self.i, self.v)
            bc = self.net_bc(self.x, self.t, self.i, self.v)
            # if bc is None:
            #     loss_bc = 0
            # else:
            loss_bc = np.linalg.norm(bc)
            # loss_bc = torch.mean((self.u - u_bc_pre0) ** 2) + torch.mean((self.u - u_bc_prex) ** 2)
            loss_u = torch.mean((self.u - u_pred) ** 2)
            loss_f = torch.mean(f_pred ** 2)
            loss = loss_u * u_weight + loss_f * f_weight + loss_bc * bc_weight  # 计算损失值
            running_loss = loss.item()  # loss累加

            # Backward and optimize
            self.optimizer_Adam.zero_grad()
            loss.backward()
            self.optimizer_Adam.step()

            # if i.any() % 200 == 199:
                # Loss.append(running_loss)
                # print('Epoch ' + str(epoch) + ' : ' + str(i // 200) + ' , LOSS =' + str(running_loss))

            if epoch % 100 == 0:
                print(
                    'It: %d, Loss: %.3e,u:%.3e,f:%.3e,bc:%.3e rohCp: %.3f, Kx: %.6f, hc: %.6f' %
                    (
                        epoch,
                        loss.item(),
                        loss_u.item(),
                        loss_f.item(),
                        loss_bc.item(),
                        self.rohCp.item(),
                        self.Kx.item(),
                        self.hc.item(),
                    )
                )
        # Loss0 = torch.tensor(loss)
        # torch.save(Loss0, 'C:/Users/ASUS/Desktop/PINNs-master/Burgers Equation/epoch_{}'.format(epoch))

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

u_weight = 1000000000
f_weight = 10
bc_weight = 1
N_u = 48000
layers = [4, 40, 40, 40, 40, 40, 20, 1]

# data = scipy.io.loadmat('data/I-E-Eoc-T.mat')

x_dim, t_dim = (20, 2400)
# Bounds of 'x' and 't':
x_min, t_min = (0, 0.)
x_max, t_max = (6.5, 2399.)

# Create tensors:
t = np.linspace(t_min, t_max, num=t_dim).reshape(t_dim, 1)
x = np.linspace(x_min, x_max, num=x_dim).reshape(x_dim, 1)
data = np.load("C:/Users/ASUS/Desktop/Work/Battery modeling/PINNs/deepxde-master/examples/heat_demo/I-E-Eoc-T.npz")
e, eoc, i, h = data["arr_0"], data["arr_1"], data["arr_2"], data["arr_3"]
v = e - eoc
v = v.flatten()[:, None]
i = i.flatten()[:, None]
Exact = np.real(data['arr_3']).T

xxv, V = np.meshgrid(x, v)
xxi, I = np.meshgrid(x, i)
X, T = np.meshgrid(x, t)

X_star = np.hstack((X.flatten()[:, None], T.flatten()[:, None], I.flatten()[:, None], V.flatten()[:, None]))
u_star = Exact.flatten()[:, None]

# Doman bounds
lb = X_star.min(0)
ub = X_star.max(0)

# Boundary data


# create training set
# idx = np.random.choice(X_star.shape[0], N_u, replace=False)
X_u_train = X_star  # [idx, :]
u_train = u_star  # [idx, :]

# training
model = PhysicsInformedNN(X_u_train, u_train, layers, lb, ub)
model.train(5000)

# evaluations
u_pred, f_pred = model.predict(X_star)

error_u = np.linalg.norm(u_star-u_pred, 2)/np.linalg.norm(u_star, 2)
error_T = np.mean((u_star-u_pred) ** 2)
print('Error u: %f' % error_u)
print('Error T: %f' % error_T)

# U_pred = griddata(X_star, u_pred.flatten(), (X, T, I, V), method='nearest')
U_pred = np.reshape(u_pred, (2400, 20))
Error = np.abs(Exact - U_pred)

rohCp_value = model.rohCp.detach().cpu().numpy()
Kx_value = model.Kx.detach().cpu().numpy()
hc_value = model.hc.detach().cpu().numpy()

error_rohCp = np.abs(rohCp_value - 30.9) * 100
error_Kx = np.abs(Kx_value - 0.8) * 100
error_hc = np.abs(hc_value - 0.12) * 100
print('Error rohCp: %.5f%%' % error_rohCp)
print('Error Kx: %.5f%%' % error_Kx)
print('Error hc: %.5f%%' % error_hc)


# plot loss
def plot_usol():
    x = np.arange(0, 6.5, 0.325)
    t = np.arange(0, 2400, 1)
    X, T = np.meshgrid(x, t)
    U = Exact
    Up = U_pred
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot_surface(X, T, U, linewidth=10, color='r')
    # ax.view_init(35, 20)
    plt.show()


def plot_u():
    x = np.arange(0, 6.5, 0.325)
    t = np.arange(0, 2400, 1)
    X, T = np.meshgrid(x, t)
    U = Exact
    Up = U_pred
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot_surface(X, T, Up, linewidth=10, color='b')
    # ax.view_init(35, 20)
    plt.show()


if __name__ == "__main__":
    # plot_loss(5000)
    plot_usol()
    plot_u()
