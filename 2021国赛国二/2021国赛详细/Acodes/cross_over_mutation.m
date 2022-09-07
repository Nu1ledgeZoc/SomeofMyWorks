function new_indiv = cross_over_mutation(cross1,cross2,pm,indiv_addr,pv,idx,xyz0,unit_vec)

    %�����彻�棬����
    [~,c]=size(cross1);   
    c2=randi(c);%���ɽ������Ϊ�����c2��
    iidx=randperm(c,c2);%0-c��Χ�ڵ������������c2����Ϊ����
    temp1=cross1(1,:);
    temp2=cross2(1,:);
    temp1(1,iidx)=cross2(1,iidx);
    temp2(1,iidx)=cross1(1,iidx);
    if rand>0.5
        new_indiv=temp1;
    else
        new_indiv=temp2;
    end
    for gene_n = 1:c
        if rand < pm
            new_indiv(1,gene_n) = rand(1,1)*1.2-0.6;
        end        
    end

    %�ж��Ƿ����Լ��,��������Ҫ���½������
        d_now=zeros(2226,1);
        d_now(indiv_addr)=new_indiv';
        while cons1(d_now,pv,idx,xyz0,unit_vec)==1
            c2=randi(c);%���ɽ������Ϊ�����c2��
            iidx=randperm(c,c2);%0-c��Χ�ڵ������������c2����Ϊ����
            temp1=cross1(1,:);
            temp2=cross2(1,:);
            temp1(1,iidx)=cross2(1,iidx);
            temp2(1,iidx)=cross1(1,iidx);
            if rand>0.5
                new_indiv=temp1;
            else
                new_indiv=temp2;
            end
            for gene_n = 1:c
                if rand < pm
                    new_indiv(1,gene_n) = rand(1,1)*1.2-0.6;
                end        
            end
        end
   

end