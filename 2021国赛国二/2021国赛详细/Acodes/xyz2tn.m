function [t,n] = xyz2tn(xyz)
%将xyz坐标转化为相对于原点的长度、单位向量
    t=sqrt(sum(xyz.^2));
    n=xyz./t;
    
end