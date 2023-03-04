import sys

sys.path.insert(0, '../Utilities/')
import torch
import copy
from collections import OrderedDict
import numpy as np
import matplotlib.pyplot as plt
import warnings
from torch.autograd import Variable

warnings.filterwarnings('ignore')

np.random.seed(1234)

# parameter setting
Tair = 15
bx = 1
ET = 0.00022

# CUDA support
device = torch.device('cuda')


# else:
#     device = torch.device('cpu')


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


class DNN1(torch.nn.Module):
    def __init__(self, layers):
        super(DNN1, self).__init__()

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


class DNN2(torch.nn.Module):
    def __init__(self, layers):
        super(DNN2, self).__init__()

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
    def __init__(self, X, u, layers, layers1, Eoc):
        # boundary conditions
        self.eoc = torch.tensor(Eoc).float().to(device)
        # data
        self.x = torch.tensor(X[:, 0:1], requires_grad=True).float().to(device)
        self.t = torch.tensor(X[:, 1:2], requires_grad=True).float().to(device)
        self.i = torch.tensor(X[:, 2:3], requires_grad=True).float().to(device)
        self.v = torch.tensor(X[:, 3:4], requires_grad=True).float().to(device)
        self.u = torch.tensor(u).float().to(device)
        # xbc_l = np.random.randint(0, 2, (48000, 1)) * 6.5
        xbc_r = np.ones(48000).reshape(48000, 1) * 6.5
        self.x_bc_r = torch.Tensor(xbc_r).requires_grad_(True).to(device)
        self.x_bc_l = torch.zeros(48000, 1).requires_grad_(True).to(device)
        self.t_ic = torch.zeros(48000, 1).requires_grad_(True).to(device)

        # settings
        self.rohCp = torch.tensor([31.0], requires_grad=True).to(device)
        self.Kx = torch.tensor([1.0], requires_grad=True).to(device)
        # self.hc = torch.tensor([0.12], requires_grad=True).to(device)

        # variable parameter
        self.rp = Variable(self.rohCp, requires_grad=True).to(device)
        self.k = Variable(self.Kx, requires_grad=True).to(device)
        # self.h = Variable(self.hc, requires_grad=True).to(device)
        # self.rp = torch.nn.Parameter(self.rohCp)
        # self.k = torch.nn.Parameter(self.Kx)
        # self.h = torch.nn.Parameter(self.hc)

        # deep neural networks
        self.dnn1 = DNN1(layers1).to(device)
        self.dnn2 = DNN2(layers1).to(device)
        self.dnn = DNN(layers).to(device)
        # self.dnn.register_parameter('rp', self.rp)
        # self.dnn.register_parameter('kb', self.k)
        # self.dnn.register_parameter('h', self.h)
        self.pde_parameter = [self.rp, self.k]   # self.h

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
        self.optimizer_Adam = torch.optim.Adam(
            self.dnn.parameters(),
            lr=0.001,
            betas=(0.9, 0.99),
            eps=1e-08,
            weight_decay=0
        )
        self.optimizer_Q = torch.optim.Adam(
            self.dnn1.parameters(),
            lr=0.001,
            betas=(0.9, 0.99),
            eps=1e-08,
            weight_decay=0
        )
        self.optimizer_Parameter = torch.optim.Adam(
            self.pde_parameter,
            lr=0.001,
            betas=(0.9, 0.99),
            eps=1e-08,
            weight_decay=0
        )
        self.optimizer_hc = torch.optim.Adam(self.dnn2.parameters())
        self.iter = 0

    def net_u(self, x, t, i, v):
        u = self.dnn(torch.cat([x, t, i, v], dim=1))
        return u

    def net_q(self, t, i, v):
        q = self.dnn1(torch.cat([t, i, v], dim=1))
        return q

    def net_h(self, x, t, i):
        hv = self.dnn2(torch.cat([x, t, i], dim=1))
        return hv

    def net_f(self, x, t, i, v):
        """ The pytorch autograd version of calculating residual """
        rohCp = self.rohCp
        Kx = self.Kx
        # hv = self.net_h(x, t, i)
        q = self.net_q(t, i, v)
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
        f = rohCp * u_t - Kx * u_xx - q
        return f

    def net_q_pde(self, t, i, v):
        u = self.u
        Eoc = self.eoc
        q = self.dnn1(torch.cat([t, i, v], dim=1))
        q_pde = bx * i * (Eoc - v - ET * u) - q
        return q_pde

    def net_bc_l(self, x_bc_l, t, i, v):
        Kx = self.Kx
        hv = self.net_h(x_bc_l, t, i)
        # hc = self.hc
        u_bc = self.dnn(torch.cat([x_bc_l, t, i, v], dim=1))
        u_bc_x = torch.autograd.grad(
            u_bc, x_bc_l,
            grad_outputs=torch.ones_like(u_bc),
            retain_graph=True,
            create_graph=True
        )[0]
        bc_l = -Kx * u_bc_x + hv * (u_bc - Tair)
        return bc_l

    def net_bc_r(self, x_bc_r, t, i, v):
        Kx = self.Kx
        hv = self.net_h(x_bc_r, t, i)
        # hc = self.hc
        u_bc = self.dnn(torch.cat([x_bc_r, t, i, v], dim=1))
        u_bc_x = torch.autograd.grad(
            u_bc, x_bc_r,
            grad_outputs=torch.ones_like(u_bc),
            retain_graph=True,
            create_graph=True
        )[0]
        bc_r = -Kx * u_bc_x - hv * (u_bc - Tair)
        return bc_r

    def net_ic(self, x, t_ic, i, v):
        u_t0 = 15
        u_ic = self.dnn(torch.cat([x, t_ic, i, v], dim=1))
        ic_loss = u_ic - u_t0
        return ic_loss

    def loss_func(self):
        u_pred = self.net_u(self.x, self.t, self.i, self.v)
        f_pred = self.net_f(self.x, self.t, self.i, self.v)
        q_pde = self.net_q_pde(self.t, self.i, self.v)
        bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
        bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
        ic = self.net_ic(self.x, self.t_ic, self.i, self.v)
        loss_bcic = np.linalg.norm(bc_l) + torch.mean(ic ** 2) + np.linalg.norm(bc_r) # np.linalg.norm(ic) bc_r
        loss_u = torch.mean((self.u - u_pred) ** 2)
        loss_f = torch.mean(f_pred ** 2)
        loss_q = torch.mean(q_pde ** 2)
        loss = loss_u * u_w + loss_f * f_w + loss_bcic * bc_w + loss_q * q_w
        #  + loss_parameter * parameter_w  # nn.functional.normalize
        self.optimizer.zero_grad()
        loss.backward()

        self.iter += 1
        # if self.iter % 100 == 0:
        #     print(
        #         'Loss: %e, rohCp: %.3f, Kx: %.6f, hc: %.6f' %
        #         (
        #             loss.item(),
        #             self.rohCp.item(),
        #             self.Kx.item(),
        #             self.hc.item(),
        #         )
        #     )
        return loss

    def train(self, nIter):
        self.dnn.train()
        self.dnn1.train()
        self.dnn2.train()
        for epoch in range(nIter):
            u_pred = self.net_u(self.x, self.t, self.i, self.v)
            f_pred = self.net_f(self.x, self.t, self.i, self.v)
            q_pde = self.net_q_pde(self.t, self.i, self.v)
            hv = self.net_h(self.x, self.t, self.i)
            bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
            bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
            ic = self.net_ic(self.x, self.t_ic, self.i, self.v)
            hc = torch.mean(hv ** 2)
            loss_bcic = np.linalg.norm(bc_l) + torch.mean(ic ** 2) + np.linalg.norm(bc_r)  # np.linalg.norm(ic)
            loss_u = torch.mean((self.u - u_pred) ** 2)
            loss_f = torch.mean(f_pred ** 2)
            loss_q = torch.mean(q_pde ** 2)
            loss = loss_u * u_w + loss_f * f_w + loss_bcic * bc_w + loss_q * q_w

            # Backward and optimize
            self.optimizer_Adam.zero_grad()
            self.optimizer_Q.zero_grad()
            self.optimizer_hc.zero_grad()
            loss.backward(retain_graph=True)

            if self.k < 0.75:
                self.k.data.clamp_(0.85, 1.15)
                self.rp.data.clamp_(30.9, 31.1)

            if epoch < 5000:
                if epoch % 100 == 0:
                    loss_p = loss_f * 1000 + loss_bcic * 1000 + loss_u * 1000
                    self.optimizer_Parameter.zero_grad()
                    loss_p.backward()

                    # parameter update
                    self.rohCp = self.rp.clone()
                    self.Kx = self.k.clone()
                # if epoch % 100 == 0:
                #     # Backward and optimize
                #     loss_p = loss_f * 1000 + loss_bcic * 1000
                #     self.optimizer_Parameter.zero_grad()
                #     loss_p.backward()
                #
                #     # parameter update
                #     self.rohCp = self.rp.clone()
                #     self.Kx = self.k.clone()

            self.optimizer_Adam.step()
            self.optimizer_Q.step()
            self.optimizer_hc.step()
            self.optimizer_Parameter.step()
            if epoch % 100 == 0:
                print(
                    'It: %d, Loss: %.3e,u:%.3e,f:%.3e,q:%.3e,bcic:%.3e  rohCp: %.3f, Kx: %.6f' %  # , hc: %.6f
                    (
                        epoch,
                        loss.item(),
                        loss_u.item(),
                        loss_f.item(),
                        loss_q.item(),
                        loss_bcic.item(),
                        self.rohCp.item(),
                        self.Kx.item(),
                    )
                )
        # Backward and optimize
        self.optimizer.step(self.loss_func)

        self.dnn1.train()
        for epoch in range(nIter):
            f_pred = self.net_f(self.x, self.t, self.i, self.v)
            q_pde = self.net_q_pde(self.t, self.i, self.v)
            loss_q = torch.mean(q_pde ** 2)
            loss_f = torch.mean(f_pred ** 2)
            loss_qt = loss_q * 1000 + loss_f * 100
            self.optimizer_Q.zero_grad()
            loss_qt.backward()
            self.optimizer_Q.step()
            if epoch % 100 == 0:
                print(
                    'It: %d, loss_hc: %.3e ' %  # , hc: %.6f
                    (
                        epoch,
                        loss_qt.item(),
                    )
                )

    def predict(self, X):
        x = torch.tensor(X[:, 0:1], requires_grad=True).float().to(device)
        t = torch.tensor(X[:, 1:2], requires_grad=True).float().to(device)
        i = torch.tensor(X[:, 2:3], requires_grad=True).float().to(device)
        v = torch.tensor(X[:, 3:4], requires_grad=True).float().to(device)

        self.dnn.eval()
        self.dnn1.eval()
        self.dnn2.eval()
        u = self.net_u(x, t, i, v)
        f = self.net_f(x, t, i, v)
        q = self.net_q(t, i, v)
        h = self.net_h(x, t, i)
        q = q.detach().cpu().numpy()
        u = u.detach().cpu().numpy()
        f = f.detach().cpu().numpy()
        h = h.detach().cpu().numpy()
        return u, f, q, h

    def state_dict(self):
        pass


# Configurations
u_w = 100000
f_w = 100000
bc_w = 100000
q_w = 1000
N_u = 48000

layers = [4, 80, 80, 80, 80, 80, 80, 1]
layers1 = [3, 80, 80, 80, 80, 80, 80, 1]

# data
x_dim, t_dim = (20, 2400)

# Bounds of 'x' and 't':
x_min, t_min = (0, 0.)
x_max, t_max = (6.5, 2399.)

# Create tensors:
t = np.linspace(t_min, t_max, num=t_dim).reshape(t_dim, 1)
x = np.linspace(x_min, x_max, num=x_dim).reshape(x_dim, 1)
data = np.load("C:/Users/ASUS/Desktop/Work/Battery modeling/PINNs/deepxde-master/examples/heat_demo/I-E-Eoc-T.npz")
e, eoc, i, h = data["arr_0"], data["arr_1"], data["arr_2"], data["arr_3"]
v = e
eo = eoc.flatten()[:, None]
v = v.flatten()[:, None]
i = i.flatten()[:, None]
Exact = np.real(data['arr_3']).T
xxe, Eoc = np.meshgrid(x, eoc)
xxv, V = np.meshgrid(x, v)
xxi, I = np.meshgrid(x, i)
X, T = np.meshgrid(x, t)
Q_exact = bx * I * (Eoc - V - ET * Exact)
# normalize
Eoc = Eoc.flatten()[:, None]
X_star = np.hstack((X.flatten()[:, None], T.flatten()[:, None], I.flatten()[:, None], V.flatten()[:, None]))
u_star = Exact.flatten()[:, None]
Q_star = Q_exact.flatten()[:, None]
# Doman bounds
lb = X_star.min(0)
ub = X_star.max(0)

# create training set
idx = np.random.choice(X_star.shape[0], N_u, replace=False)
X_u_train = X_star[idx, :]
u_train = u_star[idx, :]
Eoc_train = Eoc[idx, :]

# training
model = PhysicsInformedNN(X_u_train, u_train, layers, layers1, Eoc_train)
model.train(10000)
DNN_model = DNN(layers)
# save the model
# path = "C:/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model"XICMD

# torch.save(model.dnn, 'C:/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model//heatmodel.pt')
# import the model
# the_model = torch.load("C:/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model")

# evaluations
u_pred, f_pred, q_pred, h_pred = model.predict(X_star)
# torch.save(model, '/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model/heatmodel.pth')

# show error
error_Q = np.mean((Q_star - q_pred) ** 2)
error_T = np.mean((u_star - u_pred) ** 2)
error_h = np.mean((h_pred - 0.12) ** 2)
# U_pred = griddata(X_star, u_pred.flatten(), (X, T, I, V), method='nearest')
U_pred = np.reshape(u_pred, (2400, 20))
Error = np.abs(Exact - U_pred)
Q_pred = np.reshape(q_pred, (2400, 20))

rohCp_value = model.rohCp.detach().cpu().numpy()
Kx_value = model.Kx.detach().cpu().numpy()
hc_value = 0.12 - error_h
print('rohCp_value: %.5f' % rohCp_value)
print('Kx_value: %.5f' % Kx_value)
print('hc_valuec: %f' % hc_value)

error_rohCp = np.abs(rohCp_value - 30.9)
error_Kx = np.abs(Kx_value - 0.8)
print('Error Q: %f' % error_Q)
print('Error T: %f' % error_T)
print('Error hc: %f' % error_h)
print('Error rohCp: %.5f' % error_rohCp)
print('Error Kx: %.5f' % error_Kx)

torch.save(DNN_model.state_dict(), '/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model/DNN_model.pt')
best_model_state = copy.deepcopy(DNN_model.state_dict())
torch.save(best_model_state, '/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model/best_DNN_model.pt')


# plot loss
def plot_usol():
    x = np.arange(0, 6.5, 0.325)
    t = np.arange(0, 2400, 1)
    X, T = np.meshgrid(x, t)
    U = Exact
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot_surface(X, T, U, linewidth=10, color='r')
    plt.show()


def plot_u():
    x = np.arange(0, 6.5, 0.325)
    t = np.arange(0, 2400, 1)
    X, T = np.meshgrid(x, t)
    Up = U_pred
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot_surface(X, T, Up, linewidth=10, color='r')
    plt.show()


def plot_q():
    x = np.arange(0, 6.5, 0.325)
    t = np.arange(0, 2400, 1)
    X, T = np.meshgrid(x, t)
    Qp = Q_pred
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot_surface(X, T, Qp, linewidth=10, color='r')
    plt.show()


def plot_qe():
    x = np.arange(0, 6.5, 0.325)
    t = np.arange(0, 2400, 1)
    X, T = np.meshgrid(x, t)
    Q_e = Q_exact
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot_surface(X, T, Q_e, linewidth=10, color='b')
    plt.show()


plot_usol()
plot_u()
plot_q()
plot_qe()
