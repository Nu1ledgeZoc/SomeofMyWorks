clear;
load('idx.mat');
load('pv.mat');
load('unit_vec.mat');
load('xyz0.mat');
load('indiv_addr.mat')
load('pv_graph.mat');
chrom_len=706;
searAccur_b=0.0000001;%搜索精度
step_len=6000000000;%搜素总步长
b_min=300.7340;
b_max=300.7399;
k=1;

for i = 1:step_len
    b=b_min+i*searAccur_b

%     %利用照射面半径条件，缩小决策变量维度
%     icount=1;
%     for j = 1:2226%判断，在照射面以内的选择为决策变量
%         ggggggg=xyz0(j,:);
%         iflag=lim_l(ggggggg,b);
%         if iflag==1
%             indiv_addr(icount)=j;
%             %disp('y')
%             icount=icount+1;
%         end
%     end    
%     clear j;
%     %得到染色体长度,也即实际的控制变量个数
%     chrom_len=icount-1;
%     clear icount ggggggg iflag;

    %现阶段b所对应的理想伸缩量
    dhat_now=cal_dhat_all(b,indiv_addr,xyz0);

    %a1= abs(dhat_now) <= repmat(0.6, 2226,1);

    %jud1=sum(~a1);%should be 0
    max_rate(i)=cons1(dhat_now,xyz0,unit_vec,pv_graph);%0.0007
    if i~=1 && max_rate(i)<max_rate(i-1)
        best_rate=max_rate(i);   
        best_b=b;
    end
%     if jud1==0 
%         b_ideal_set(k)=b;
%         k=k+1;
%     end
    if b>= b_max
        break;
    end
end
len=length(max_rate);
plot(linspace(b_min,b_max,len),max_rate);

%%
clear;
load('idx.mat');
load('pv.mat');
load('unit_vec.mat');
load('xyz0.mat');
load('indiv_addr.mat')
b=300.4021;
dhat_now=cal_dhat_all(b,indiv_addr,xyz0);
jud2=cons1(dhat_now,pv,idx,xyz0,unit_vec)

%%
%作图
b=3.007387273000000e+02;
dhat_now=cal_dhat_all(b,indiv_addr,xyz0);
xyzbest=back2xyz(dhat_now,xyz0,unit_vec);
scatter3(xyzbest(:,1),xyzbest(:,2),xyzbest(:,3),100,abs(xyzbest(:,3)),'.')
hold on
scatter3(xyz0(:,1),xyz0(:,2),xyz0(:,3),100,'.')





















