%  1-D信号压缩传感的实现(正交匹配追踪法Orthogonal Matching Pursuit)
%  测量数M>=K*log(N/K),K是稀疏度,N信号长度,可以近乎完全重构
%  编程人--香港大学电子工程系 沙威  Email: wsha@eee.hku.hk
%  编程时间：2008年11月18日
%  文档下载: http://www.eee.hku.hk/~wsha/Freecode/freecode.htm 
%  参考文献：Joel A. Tropp and Anna C. Gilbert 
%  Signal Recovery From Random Measurements Via Orthogonal Matching
%  Pursuit，IEEE TRANSACTIONS ON INFORMATION THEORY, VOL. 53, NO. 12,
%  DECEMBER 2007.
tic
clc;
clear

% [x,fs,bits]=WAVREAD('M1_1',[8400 8719]);
%%  1. 时域测试信号生成
K=7;      %  稀疏度(做FFT可以看出来)
N=320;    %  信号长度
M=100;     %  测量数(M>=K*log(N/K),至少40,但有出错的概率)

f1=50;    %  信号频率1
f2=100;   %  信号频率2
f3=200;   %  信号频率3
f4=400;   %  信号频率4
fs=800;   %  采样频率
ts=1/fs;  %  采样间隔
Ts=1:N;   %  采样序列
x=0.3*cos(2*pi*f1*Ts*ts)+0.6*cos(2*pi*f2*Ts*ts)+0.1*cos(2*pi*f3*Ts*ts)+0.9*cos(2*pi*f4*Ts*ts);  %  完整信号
x=x';
%%  2.  时域信号压缩传感
Phi=randn(M,N);                                   %  测量矩阵(高斯分布白噪声)
s=Phi*x;                                        %  获得线性测量 

%%  3.  正交匹配追踪法重构信号(本质上是L_1范数最优化问题)
m=K;                                            %  算法迭代次数(m>=K)
Psi=fft(eye(N,N))/sqrt(N);                        %  傅里叶正变换矩阵
T=Phi*Psi';                                       %  恢复矩阵(测量矩阵*正交反变换矩阵)

hat_y=zeros(1,N);                                 %  待重构的谱域(变换域)向量                     
Aug_t=[];                                         %  增量矩阵(初始值为空矩阵)
r_n=s;  %  残差值
iter=1;
for times=1:m
%   while(norm(r_n)>10^-5)                                 %  迭代次数(有噪声的情况下,该迭代次数为K)
    for col=1:N;                                  %  恢复矩阵的所有列向量
        product(col)=abs(T(:,col)'*r_n);          %  恢复矩阵的列向量和残差的投影系数(内积值) 
    end
    a=sort(abs(product));
    [val,pos]=max(product);                       %  最大投影系数对应的位置
    Aug_t=[Aug_t,T(:,pos)];                       %  矩阵扩充
    T(:,pos)=zeros(M,1);                          %  选中的列置零（实质上应该去掉，为了简单我把它置零）
    aug_y=(Aug_t'*Aug_t)^(-1)*Aug_t'*s; %  最小二乘,使残差最小
    r_n=s-Aug_t*aug_y;                            %  残差
    pos_array(iter)=pos;                         %  纪录最大投影系数的位置
  
    iter=iter+1;                                        %相当于稀疏度
  end
hat_y(pos_array)=aug_y;                           %  重构的谱域向量
hat_x=real(Psi'*hat_y.');                         %  做逆傅里叶变换重构得到时域信号

%%  4.  恢复信号和原始信号对比
figure(1);
hold on;
plot(hat_x,'k.-')                                 %  重建信号
plot(x,'r')                                       %  原始信号
legend('Recovery','Original')
error=norm(hat_x-x)^2/norm(x)^2                         %  重构误差
snr=10*log10(1/error)
iter=iter-1
hold off
toc