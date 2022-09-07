function iflag = lim_l(xyz,b)
    %b为顶点在z轴上的抛物面方程的参数,b>0
    %判断xyz是否在照明面内
        r=3.004000111215428e+02;
        z=150^2/(4*(b-(1-0.466)*r))-b;%照明面边缘z值
        l=sqrt((z+b)^2+150^2);
        G=[0 0 -b];%顶点坐标
        if d3(G,xyz) <= l
            iflag=1;
        else
            iflag=0;
        end
    
    end