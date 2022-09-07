function [fit_val,r_mse] = fitness(indiv_addr,indiv,xyz0,b,generation)
%通过地址找到对应的主索节点的径向单位矢量，接着可以找到理想伸缩量，接着可以计算误差
%indiv_addr 个体的gene所对应的节点索引
%indiv      个体的染色体
%generation 当前迭代代数

    chrom_len=length(indiv);
    amse=zeros(chrom_len,1);
    for index = 1:chrom_len
        xyz=xyz0(indiv_addr(index),:);
        t=sqrt(sum(xyz.^2));
        n=xyz./t;
        %得到单位向量
        real_t=find_t(n,b);
        %得到参数t
        dhat=t-real_t;
        %得到当前基因位所对节点上的伸缩量误差的平方
        amse(index)=(dhat-indiv(index))^2;
    end
    fit_val=sum(amse)/chrom_len;
    r_mse=fit_val;
    %演化后期，加快收敛
    if generation > 150
        fit_val=1/((fit_val).^2+0.00001);
    else
        fit_val=1/((100*fit_val)+0.00001);%防止除不尽
    end
end