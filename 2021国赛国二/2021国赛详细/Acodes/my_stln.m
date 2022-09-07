%确保idx pv unit_vec xyz0已经load
popsize=10;
pc=0.7;
pm=0.005;%在mutation函数中设置
generation=200;
ceritera=0.004;%mse应该小于 0.004m
b=300.4;
% best_mse=zeros(120,1);
% aver_mse=zeros(120,1);
% %b取值为-300.4+-0.6m最高点去掉不试，尝试的时候可能太高就没有解了，这时候要把退出条件放松
% b=-300.4-0.6;
% for n_b = 1:120%step=1.2/120=0.01
    

%     b=b+0.01;
% end


rng(sum(clock));%确保随机性
 %==================%初始化种群
    icount=1;
    for j = 1:2226%判断，在照射面以内的选择为决策变量
        ggggggg=xyz0(j,:);
        iflag=lim_l(ggggggg,b);
        if iflag==1
            indiv_addr(icount)=j;
            %disp('y')
            icount=icount+1;
        end
    end    
    %得到染色体长度
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
            d_now(indiv_addr)=pop(n_indiv,:)';%列向量，个体染色体是行向量，所以这里转置
        end        
        disp('y');
    end
    

%种群的迭代值记录
amse=zeros(generation,1);%记录每代平均的mse值
bmse=zeros(generation,1);%记录每代最优的mse值
bindiv=zeros(generation,chrom_len);%记录每代最优的染色体



%TODO:修改cross和mutation程序，使得它们可以在约束内修改染色体
%===================%开始演化计算
i=1;
while i<=generation %&& bmse(i)>ceritera
   
    %================%计算种群适应度
    fit_p=zeros(popsize,1);
    temp_mse=zeros(popsize,1);%记录当前代所有的mse
    for n_indiv = 1:popsize
        [fit_p(n_indiv),temp_mse(n_indiv)]=fitness(indiv_addr,pop(n_indiv,:),xyz0,b,generation);        
    end


    fit_p=fit_p./sum(fit_p);
    [~,I]=max(fit_p);
    elite=pop(I,:);%取出精英

    %记录最优mse值   
        bmse(i,1)=temp_mse(I);
    %记录最优个体
    
        bindiv(i,:)=elite;
    
    %记录每代平均的mse
 
        jksahkjhd=sum(temp_mse)/popsize;
        amse(i,1)=jksahkjhd;
        clear jksahkjhd;


    %开始下一代
    i=i+1;
    temp=pop;

    %=================%产生新种群
    pop(1,:)=elite;%保留精英
    %交叉与变异
    for n_indiv = 2:popsize

        %while sum(~(pop(n_indiv,:)==temp(n_indiv,:)))==0 保留一定劣解，增加多样性
            %除了精英不改变，其他的每个个体都要变成交叉后的个体
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
