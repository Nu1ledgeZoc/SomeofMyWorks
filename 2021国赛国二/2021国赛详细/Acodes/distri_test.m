title('编号排布规律示意图','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
for i=1:2226
    hold on;
    scatter(idx_xyz.X(i),idx_xyz.Y(i),500,'.b');
     pause(0.5);
     str=strcat('\leftarrow',idx{i});
    text(idx_xyz.X(i),idx_xyz.Y(i),str, 'FontSize',10,'FontName','Times New Roman');
end
%%
%按高度画出三维图像
%主索结点图
title('主索结点排布规律示意图','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');
p=scatter3(x,y,z,100,z.^2,'.');
%%
%俯视图
title('主索结点排布俯视图','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
scatter(x,y,100,z.^2,'.');

%%
%主索
title('主索与下端点面','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');
scatter3(x,y,z,100,z.^2,'.');
hold on
p=scatter3(xd,yd,zd,100,'.');
%%
title('下端点面','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');
p=scatter3(xd,yd,zd,100,'.');
%%
subplot(2,2,1);

p=scatter3(x,y,z,100,z.^2,'.');
title('主索结点排布规律示意图','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');
subplot(2,2,2);

p=scatter3(xd,yd,zd,100,'.');
title('下端点面','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');
subplot(2,2,3);

scatter(x,y,100,z.^2,'.');
title('主索结点排布俯视图','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
subplot(2,2,4);

p=scatter3(x_std,y_std,z_std,100,'.m');
title('基准态面','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');
%%

scatter3(x_std,y_std,z_std,100,'.m');
hold on;
scatter3(xd,yd,zd,100,'.g');
title('基准态面与下端点面(平均欧式距离为1.98m)','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');
Sigma_d=sum(sqrt((xd-x_std).^2+(yd-y_std).^2+(zd-z_std).^2))/2226;
%%

scatter(x,y,z-z_std,100,linspace(1,10,2226),'.');
title('附件1面与基准态面距离分布','FontName','宋体');
xlabel('X/m','FontName','Times New Roman');
ylabel('Y/m','FontName','Times New Roman');
zlabel('Z/m','FontName','Times New Roman');





