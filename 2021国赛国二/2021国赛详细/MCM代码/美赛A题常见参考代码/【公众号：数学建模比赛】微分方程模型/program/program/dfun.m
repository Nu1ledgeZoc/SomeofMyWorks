function bd=dfun(t,b);
bd=zeros(3,1);
bd(1)=-b(1)+b(2)+b(3)+b(1)*((b(1)^2)+(b(2)^2)+(b(3)^2));
bd(2)=-b(1)-b(2)+b(3)+b(2)*((b(1)^2)+(b(2)^2)+(b(3)^2));
bd(3)=-b(1)-b(2)-b(3)+b(3)*((b(1)^2)+(b(2)^2)+(b(3)^2));
