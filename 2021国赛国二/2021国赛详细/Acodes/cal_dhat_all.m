function dhat_all = cal_dhat_all(b,indiv_addr,xyz0)
    len=length(indiv_addr);%应计算的节点个数
    dhat_all=zeros(2226,1);
    for index = 1:len
       xyz_org=xyz0(indiv_addr(index),:);
       t0=sqrt(sum(xyz_org.^2));
       u_vec=xyz_org/t0;
       t_now=find_t(u_vec,b);%通过当前点的固定径向，求解现在的理想抛物面上对应节点距原点的距离
       dhat_all(indiv_addr(index),1)=t0-t_now;
    end
end