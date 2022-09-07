function [fit_val,r_mse] = fitness(indiv_addr,indiv,xyz0,b,generation)
%ͨ����ַ�ҵ���Ӧ�������ڵ�ľ���λʸ�������ſ����ҵ����������������ſ��Լ������
%indiv_addr �����gene����Ӧ�Ľڵ�����
%indiv      �����Ⱦɫ��
%generation ��ǰ��������

    chrom_len=length(indiv);
    amse=zeros(chrom_len,1);
    for index = 1:chrom_len
        xyz=xyz0(indiv_addr(index),:);
        t=sqrt(sum(xyz.^2));
        n=xyz./t;
        %�õ���λ����
        real_t=find_t(n,b);
        %�õ�����t
        dhat=t-real_t;
        %�õ���ǰ����λ���Խڵ��ϵ�����������ƽ��
        amse(index)=(dhat-indiv(index))^2;
    end
    fit_val=sum(amse)/chrom_len;
    r_mse=fit_val;
    %�ݻ����ڣ��ӿ�����
    if generation > 150
        fit_val=1/((fit_val).^2+0.00001);
    else
        fit_val=1/((100*fit_val)+0.00001);%��ֹ������
    end
end