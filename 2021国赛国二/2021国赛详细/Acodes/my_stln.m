%ȷ��idx pv unit_vec xyz0�Ѿ�load
popsize=10;
pc=0.7;
pm=0.005;%��mutation����������
generation=200;
ceritera=0.004;%mseӦ��С�� 0.004m
b=300.4;
% best_mse=zeros(120,1);
% aver_mse=zeros(120,1);
% %bȡֵΪ-300.4+-0.6m��ߵ�ȥ�����ԣ����Ե�ʱ�����̫�߾�û�н��ˣ���ʱ��Ҫ���˳���������
% b=-300.4-0.6;
% for n_b = 1:120%step=1.2/120=0.01
    

%     b=b+0.01;
% end


rng(sum(clock));%ȷ�������
 %==================%��ʼ����Ⱥ
    icount=1;
    for j = 1:2226%�жϣ������������ڵ�ѡ��Ϊ���߱���
        ggggggg=xyz0(j,:);
        iflag=lim_l(ggggggg,b);
        if iflag==1
            indiv_addr(icount)=j;
            %disp('y')
            icount=icount+1;
        end
    end    
    %�õ�Ⱦɫ�峤��
    chrom_len=icount-1;
    clear icount ggggggg iflag;

    pop=zeros(popsize,chrom_len);
    for n_indiv = 1:popsize
        pop(n_indiv,:)=rand(1,chrom_len).*1.2-0.6;
        d_now=zeros(2226,1);
        d_now(indiv_addr)=pop(n_indiv,:)';
        while cons1(d_now,pv,idx,xyz0,unit_vec)==1
            pop(n_indiv,:)=rand(1,chrom_len).*1.2-0.6;
            d_now=zeros(2226,1);
            d_now(indiv_addr)=pop(n_indiv,:)';%������������Ⱦɫ��������������������ת��
        end        
        disp('y');
    end
    

%��Ⱥ�ĵ���ֵ��¼
amse=zeros(generation,1);%��¼ÿ��ƽ����mseֵ
bmse=zeros(generation,1);%��¼ÿ�����ŵ�mseֵ
bindiv=zeros(generation,chrom_len);%��¼ÿ�����ŵ�Ⱦɫ��



%TODO:�޸�cross��mutation����ʹ�����ǿ�����Լ�����޸�Ⱦɫ��
%===================%��ʼ�ݻ�����
i=1;
while i<=generation %&& bmse(i)>ceritera
   
    %================%������Ⱥ��Ӧ��
    fit_p=zeros(popsize,1);
    temp_mse=zeros(popsize,1);%��¼��ǰ�����е�mse
    for n_indiv = 1:popsize
        [fit_p(n_indiv),temp_mse(n_indiv)]=fitness(indiv_addr,pop(n_indiv,:),xyz0,b,generation);        
    end


    fit_p=fit_p./sum(fit_p);
    [~,I]=max(fit_p);
    elite=pop(I,:);%ȡ����Ӣ

    %��¼����mseֵ   
        bmse(i,1)=temp_mse(I);
    %��¼���Ÿ���
    
        bindiv(i,:)=elite;
    
    %��¼ÿ��ƽ����mse
 
        jksahkjhd=sum(temp_mse)/popsize;
        amse(i,1)=jksahkjhd;
        clear jksahkjhd;


    %��ʼ��һ��
    i=i+1;
    temp=pop;

    %=================%��������Ⱥ
    pop(1,:)=elite;%������Ӣ
    %���������
    for n_indiv = 2:popsize

        %while sum(~(pop(n_indiv,:)==temp(n_indiv,:)))==0 ����һ���ӽ⣬���Ӷ�����
            %���˾�Ӣ���ı䣬������ÿ�����嶼Ҫ��ɽ����ĸ���
        for n_indiv1 = 1:popsize
            if fit_p(n_indiv1)>rand
                cross1=temp(n_indiv1,:);
                for n_indiv2 = 1:popsize
                    if fit_p(n_indiv2)>rand
                        cross2=temp(n_indiv2,:);
                        pop(n_indiv,:)=cross_over_mutation(cross1,cross2,pm,indiv_addr,pv,idx,xyz0,unit_vec);
                    end
                end
            end
        end
        %end
    end
   

end

min(bmse);
plot(1:generation,amse,'.-g',1:generation,bmse,'m');
