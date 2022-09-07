function r_mse = fit2(indiv)
    %ͨ����ַ�ҵ���Ӧ�������ڵ�ľ���λʸ�������ſ����ҵ����������������ſ��Լ������
    %indiv_addr �����gene����Ӧ�Ľڵ�����
    %indiv      �����Ⱦɫ��
    %generation ��ǰ��������
    load('indiv_addr.mat')
    load('xyz0.mat')
    load('best_b.mat')
    b=best_b;
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
        r_mse=15*(fit_val+80*cons2(indiv));%���뷣���������ҷŴ�Ŀ�꺯����Ϊ��Ӧ��
    end