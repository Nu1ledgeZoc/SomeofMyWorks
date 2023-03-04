import sys

sys.path.insert(0, '../Utilities/')
import torch
import copy
from collections import OrderedDict
import numpy as np
import matplotlib.pyplot as plt
import warnings

warnings.filterwarnings('ignore')

np.random.seed(1234)

# parameter setting
Tair = 15
bx = 1
ET = 0.00022
device = torch.device('cuda')


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
    def __init__(self, X, u, layers, layers1, lb, ub):
        # boundary conditions
        self.lb = torch.tensor(lb).float().to(device)
        self.ub = torch.tensor(ub).float().to(device)

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
        self.rohCp = torch.tensor([30.9], requires_grad=True).to(device)
        self.Kx = torch.tensor([0.8], requires_grad=True).to(device)
        # variable parameter
        # self.hc = torch.tensor([0.12], requires_grad=True).to(device)

        self.rp = torch.nn.Parameter(self.rohCp)
        self.k = torch.nn.Parameter(self.Kx)
        # self.h = torch.nn.Parameter(self.hc)

        # deep neural networks
        self.dnn1 = DNN1(layers1).to(device)
        self.dnn2 = DNN2(layers1).to(device)
        self.dnn = DNN(layers).to(device)
        self.dnn.register_parameter('rp', self.rp)
        self.dnn.register_parameter('kb', self.k)
        # self.dnn.register_parameter('h', self.h)


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
        self.optimizer_Q = torch.optim.Adam(self.dnn1.parameters())
        self.optimizer_hc = torch.optim.Adam(self.dnn2.parameters())
        self.iter = 0

    def net_u(self, x, t, i, v):
        u = self.dnn(torch.cat([x, t, i, v], dim=1))
        return u

    def net_q(self, t, i, v):
        q = self.dnn1(torch.cat([t, i, v], dim=1))
        return q

    def net_f(self, x, t, i, v):
        """ The pytorch autograd version of calculating residual """
        rohCp = self.rohCp
        Kx = self.Kx
        # hc = self.net_h(x, t, i)
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

    def net_h(self, x, t, i):
        hv = self.dnn2(torch.cat([x, t, i], dim=1))
        return hv

    def net_q_pde(self, t, i, v):
        u = self.u
        q = self.net_q(t, i, v)
        q_pde = bx * i * (v - ET * u) - q
        return q_pde

    def net_bc_l(self, x_bc_l, t, i, v):
        Kx = self.Kx
        hv = self.net_h(x_bc_l, t, i)
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
        hv = self.net_h(self.x, self.t, self.i)
        bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
        bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
        ic = self.net_ic(self.x, self.t_ic, self.i, self.v)
        loss_bcic = np.linalg.norm((bc_l + bc_r) * 0.5) + torch.mean(ic ** 2)  # np.linalg.norm(ic)
        loss_u = torch.mean((self.u - u_pred) ** 2)
        loss_f = torch.mean(f_pred ** 2)
        loss_q = torch.mean(q_pde ** 2)
        loss_h = torch.mean(q_pde ** 2)
        loss = loss_u * u_w + loss_f * f_w + loss_bcic * bc_w + loss_q * q_w
        #  + loss_parameter * parameter_w  # nn.functional.normalize
        self.optimizer.zero_grad()
        self.optimizer_Q.zero_grad()
        self.optimizer_hc.zero_grad()
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
        for epoch in range(nIter):
            u_pred = self.net_u(self.x, self.t, self.i, self.v)
            f_pred = self.net_f(self.x, self.t, self.i, self.v)
            bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
            bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
            ic = self.net_ic(self.x, self.t_ic, self.i, self.v)
            loss_bcic = np.linalg.norm((bc_l + bc_r) * 0.5) + torch.mean(ic ** 2)  # np.linalg.norm(ic)
            loss_u = torch.mean((self.u - u_pred) ** 2)
            loss_f = torch.mean(f_pred ** 2)
            loss = loss_u * u_w + loss_f * f_w + loss_bcic * bc_w  # + loss_q * q_w

            # Backward and optimize
            self.optimizer_Adam.zero_grad()
            loss.backward()
            self.optimizer_Adam.step()

            for self.k in self.dnn.parameters():
                if self.k.detach().cpu().all().numpy() < 0:
                    self.k.data.clamp(0.79999, 0.80001)
                    self.rp.data.clamp(30.89999, 30.90001)

            if epoch > 8000:
                if epoch % 500 == 0:
                    # Backward and optimize
                    # parameter update
                    self.rohCp = self.rp.clone()
                    self.Kx = self.k.clone()

            if epoch % 100 == 0:
                print(
                    'It: %d, Loss: %.3e,u:%.3e,f:%.3e,bcic:%.3e  rohCp: %.3f, Kx: %.6f' %
                    (
                        epoch,
                        loss.item(),
                        loss_u.item(),
                        loss_f.item(),
                        loss_bcic.item(),
                        self.rohCp.item(),
                        self.Kx.item(),
                    )
                )
        # Backward and optimize
        self.optimizer.step(self.loss_func)
        # Q training
        self.dnn1.train()
        for epoch in range(nIter):
            q_pde = self.net_q_pde(self.t, self.i, self.v)
            loss_q = torch.mean(q_pde ** 2)
            loss_qt = loss_q * q_w
            self.optimizer_Q.zero_grad()
            loss_qt.backward()
            self.optimizer_Q.step()
        # self.optimizer_Q.step(self.loss_func)
        # hc training
        self.dnn2.train()
        for epoch in range(nIter):
            hv = self.net_h(self.x, self.t, self.i)
            bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
            bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
            ic = self.net_ic(self.x, self.t_ic, self.i, self.v)
            loss_hc = np.linalg.norm(bc_l) + torch.mean(ic ** 2) + np.linalg.norm(bc_r)
            self.optimizer_hc.zero_grad()
            loss_hc.backward()
            self.optimizer_hc.step()

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
f_w = 1000
bc_w = 10000
q_w = 10000
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
v = e - eoc
v = v.flatten()[:, None]
i = i.flatten()[:, None]
Exact = np.real(data['arr_3']).T
xxv, V = np.meshgrid(x, v)
xxi, I = np.meshgrid(x, i)
X, T = np.meshgrid(x, t)
Q_exact = bx * I * (V - ET * Exact)
# normalize
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

# training
model = PhysicsInformedNN(X_u_train, u_train, layers, layers1, lb, ub)
model.train(100)
DNN_model = DNN(layers)
# save the model
# path = "C:/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model"
# torch.save(model.dnn, 'C:/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model//heatmodel.pt')
# import the model
# the_model = torch.load("C:/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model")

# evaluations
u_pred, f_pred, q_pred, h_pred = model.predict(X_star)
# torch.save(model, '/Users/ASUS/Desktop/PINNs-master/Burgers Equation/model/heatmodel.pth')

# show error
error_u = np.linalg.norm(u_star - u_pred, 2) / np.linalg.norm(u_star, 2)
error_T = np.mean((u_star - u_pred) ** 2)
print('Error u: %f' % error_u)
print('Error T: %f' % error_T)

# U_pred = griddata(X_star, u_pred.flatten(), (X, T, I, V), method='nearest')
U_pred = np.reshape(u_pred, (2400, 20))
Error = np.abs(Exact - U_pred)
Q_pred = np.reshape(q_pred, (2400, 20))

rohCp_value = model.rohCp.detach().cpu().numpy()
Kx_value = model.Kx.detach().cpu().numpy()
hc_value = np.mean((h_pred - 0.12) ** 2)

error_rohCp = np.abs((rohCp_value - 30.9) / 30.9) * 100
error_Kx = np.abs((Kx_value - 0.8) / 0.8) * 100
# error_hc = np.abs((hc_value - 0.12) / 0.12) * 100
print('Error rohCp: %.5f%%' % error_rohCp)
print('Error Kx: %.5f%%' % error_Kx)
print('Error hc: %.5f%%' % hc_value)

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
    ax.plot_surface(X, T, Qp, linewidth=10, color='b')
    plt.show()


def plot_qe():
    x = np.arange(0, 6.5, 0.325)
    t = np.arange(0, 2400, 1)
    X, T = np.meshgrid(x, t)
    Q_exact = Q_exact
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot_surface(X, T, Q_exact, linewidth=10, color='b')
    plt.show()


plot_usol()
plot_u()
plot_q()