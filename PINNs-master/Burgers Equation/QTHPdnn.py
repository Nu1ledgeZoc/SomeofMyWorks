# First
def train(self, nIter):
    self.dnn.train()
    for epoch in range(nIter):
        u_pred = self.net_u(self.x, self.t, self.i, self.v)
        f_pred = self.net_f(self.x, self.t, self.i, self.v)
        q_pde = self.net_q_pde(self.t, self.i, self.v)
        loss_q = torch.mean(q_pde ** 2)
        bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
        bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
        ic = self.net_ic(self.x, self.t_ic, self.i, self.v)
        loss_bcic = np.linalg.norm(bc_l) + torch.mean(ic ** 2) + np.linalg.norm(bc_r)  # np.linalg.norm(ic)
        loss_u = torch.mean((self.u - u_pred) ** 2)
        loss_f = torch.mean(f_pred ** 2)
        loss = loss_u * u_w + loss_f * f_w + loss_bcic * bc_w + loss_q * q_w

        # Backward and optimize
        self.optimizer_Adam.zero_grad()
        self.optimizer_Q.zero_grad()
        loss.backward(retain_graph=True)
        # self.optimizer_Adam.step()

        # for self.k in self.dnn.parameters():
        #     if self.k.detach().cpu().all().numpy() < 0.5:
        #         self.k.data.clamp_(0.79999, 0.80001)
        #         self.rp.data.clamp_(30.89999, 30.90001)
        if self.k < 0.7:
            self.k.data.clamp_(0.8, 1.0)
            self.rp.data.clamp_(30.90, 31.10)
        # if (self.k - self.Kx).abs() < 0.001:

        if epoch < 1500:
            if epoch % 100 == 0:
                # Backward and optimize
                loss_p = loss_f * 100 + loss_bcic * 10
                self.optimizer_Parameter.zero_grad()
                loss_p.backward()
                # self.optimizer_Parameter.step()
                # parameter update
                self.rohCp = self.rp.clone()
                self.Kx = self.k.clone()
                # self.hc = self.h.clone()
                # if epoch % 500 == 0:
                #     # Backward and optimize
                #     # parameter update
                #     self.rohCp = self.rp.clone()
                #     self.Kx = self.k.clone()

        self.optimizer_Adam.step()
        self.optimizer_Q.step()
        self.optimizer_Parameter.step()
        if epoch % 100 == 0:
            print(
                'It: %d, Loss: %.3e,u:%.3e,f:%.3e,bcic:%.3e  rohCp: %.3f, Kx: %.6f' %  # , hc: %.6f
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

    self.dnn2.train()
    for epoch in range(nIter):
        u_pred = self.net_u(self.x, self.t, self.i, self.v)
        hv = self.net_h(self.x, self.t, self.i)
        hc = torch.mean(hv ** 2)
        bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
        bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
        loss_hc = np.linalg.norm(bc_l) * 100 + np.linalg.norm(bc_r) * 100 + torch.mean((self.u - u_pred) ** 2)

        self.optimizer_hc.zero_grad()
        self.optimizer_Parameter.zero_grad()
        self.optimizer_Adam.zero_grad()
        loss_hc.backward()
        self.optimizer_hc.step()
        self.optimizer_Parameter.step()
        self.optimizer_Adam.step()

        if epoch % 100 == 0:
            print(
                'It: %d, loss_hc: %.3e hc: %.6f' %  # , hc: %.6f
                (
                    epoch,
                    loss_hc.item(),
                    hc.item(),
                )
            )

    self.dnn1.train()
    for epoch in range(nIter):
        f_pred = self.net_f(self.x, self.t, self.i, self.v)
        q_pde = self.net_q_pde(self.t, self.i, self.v)
        loss_q = torch.mean(q_pde ** 2)
        loss_f = torch.mean(f_pred ** 2)
        loss_qt = loss_q * 1000 + loss_f * 100
        self.optimizer_Q.zero_grad()
        self.optimizer_Adam.zero_grad()
        loss_qt.backward()
        self.optimizer_Q.step()
        self.optimizer_Adam.step()

# Second
    def train1(self, nIter):
        self.dnn.train1()
        self.dnn1.train1()
        self.dnn2.train1()
        for epoch in range(nIter):
            u_pred = self.net_u(self.x, self.t, self.i, self.v)
            f_pred = self.net_f(self.x, self.t, self.i, self.v)
            q_pde = self.net_q_pde(self.t, self.i, self.v)
            loss_q = torch.mean(q_pde ** 2)
            bc_l = self.net_bc_l(self.x_bc_l, self.t, self.i, self.v)
            bc_r = self.net_bc_r(self.x_bc_r, self.t, self.i, self.v)
            ic = self.net_ic(self.x, self.t_ic, self.i, self.v)
            Kx, hc = self.net_para(self.x, self.t, self.i)
            loss_bcic = np.linalg.norm(bc_l) + torch.mean(ic ** 2) + np.linalg.norm(bc_r)  # np.linalg.norm(ic)
            loss_u = torch.mean((self.u - u_pred) ** 2)
            loss_f = torch.mean(f_pred ** 2)
            # loss_hc = np.linalg.norm(bc_l) + np.linalg.norm(bc_r) + loss_f + loss_u
            # loss_qt = loss_q * 1000 + loss_f * 100
            loss = loss_u * u_w + loss_f * f_w + loss_bcic * bc_w + loss_q * q_w

            # Backward and optimize
            self.optimizer_Adam.zero_grad()
            self.optimizer_Q.zero_grad()
            self.optimizer_hc.zero_grad()
            loss.backward(retain_graph=True)
            # loss_qt.backward()
            # loss_hc.backward()
            # self.optimizer_Adam.step()


            if self.rp < 30:
                self.rp.data.clamp_(30.90, 31.00)
            # if (self.k - self.Kx).abs() < 0.001:

            if epoch < 5000:
                if epoch % 100 == 0:
                    # Backward and optimize
                    loss_p = loss_f * 100 + loss_bcic * 10
                    self.optimizer_Parameter.zero_grad()
                    loss_p.backward()
                    # self.optimizer_Parameter.step()
                    # parameter update
                    self.rohCp = self.rp.clone()

            self.optimizer_Adam.step()
            self.optimizer_Q.step()
            self.optimizer_Parameter.step()
            if epoch % 100 == 0:
                print(
                    'It: %d, Loss: %.3e,u:%.3e,f:%.3e,bcic:%.3e rohCp: %.3f, Kx: %.6f, hc: %.6f' %  # rohCp: %.3f, Kx: %.6f, hc: %.6f
                    (
                        epoch,
                        loss.item(),
                        loss_u.item(),
                        loss_f.item(),
                        loss_bcic.item(),
                        # loss_q.item(),
                        self.rohCp.item(),
                        Kx.item(),
                        hc.item(),
                    )
                )
        # Backward and optimize
        self.optimizer.step(self.loss_func)