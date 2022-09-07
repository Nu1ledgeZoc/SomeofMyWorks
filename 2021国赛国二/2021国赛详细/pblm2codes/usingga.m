clear;
load('best_b.mat');
load('indiv_addr.mat');
load('xyz0.mat');
d_hat_all=cal_dhat_all(best_b,indiv_addr,xyz0);
tmp=d_hat_all(indiv_addr,1);
len=length(indiv_addr);
x0=randn(len,1)*0.0006;
x0=zeros(len,1);
lb=repmat(-0.6,len,1);
ub=repmat(0.6,len,1);
options = optimoptions('ga','PlotFcn', 'gaplotbestf');
[x2 fval,~,output,scores]=ga(@fit2,len,[],[],[],[],lb,ub,[],options);

%%
d_now=zeros(2226,1);
d_now(indiv_addr,1)=x2';
d_best=d_now;
xyz_best=back2xyz(d_now,xyz0,unit_vec);
xyz_best_transback=tran_xyz(xyz_best,'b');

scatter3(xyz_best(:,1),xyz_best(:,2),xyz_best(:,3),100,abs(xyz_best(:,3)),'.')
hold on;
xyz2=tran_xyz(xyz0,'b');
scatter3(xyz0(:,1),xyz0(:,2),xyz0(:,3),100,'.');