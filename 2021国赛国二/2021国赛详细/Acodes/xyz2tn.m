function [t,n] = xyz2tn(xyz)
%��xyz����ת��Ϊ�����ԭ��ĳ��ȡ���λ����
    t=sqrt(sum(xyz.^2));
    n=xyz./t;
    
end