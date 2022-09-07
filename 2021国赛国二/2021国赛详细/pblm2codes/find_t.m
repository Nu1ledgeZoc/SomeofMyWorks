function t = find_t(u_vec,b)
%b > 0
%t > 0
r=3.004000111215428e+02;
k=(u_vec(1)^2+u_vec(2)^2)/(4*(b-(1-0.466)*r));
if k<1e-10
    t=-b/u_vec(3);
else
t=(u_vec(3)+sqrt(u_vec(3)^2+4*k*b))/(2*k);
end
end

