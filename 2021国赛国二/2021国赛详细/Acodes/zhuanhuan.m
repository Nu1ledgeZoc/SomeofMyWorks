function xin_xyz=zhuanhuan(xyz0)
e0=[1 1 1; 1 1 1];
e3=[0.164181178906956;0.122800869683098;0.978756602479798];
answ=fsolve(@eqn2,e0);
A=[answ' e3];%A^-1=A'
B=size(xyz0);
xin_xyz=zeros(B(1),B(2));
for i=1:B(1)
    xin_xyz(i,:)=(A'*xyz0(i,:)')';
end
end