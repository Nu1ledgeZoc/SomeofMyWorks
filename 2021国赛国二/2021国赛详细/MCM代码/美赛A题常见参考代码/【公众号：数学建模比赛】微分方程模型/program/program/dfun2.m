function bd=dfun2(t,b);
bd=zeros(3,1);
bd(1)=9.762*b(1)+75*b(2)-84.762*b(3)*b(1);
bd(2)=1.6923*(b(1)-b(2));
bd(3)=8.57898*(b(1)-b(3));