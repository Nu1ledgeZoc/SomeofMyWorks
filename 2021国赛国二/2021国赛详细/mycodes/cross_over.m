function pop2 = cross_over(pop1)
    %两个体交叉，变异是整个种群
    [~,c]=size(pop1);   
    c2=randi(c);%生成交叉点数为随机的c2个
    idx=randperm(c,c2);%0-c范围内的数，随机生成c2个作为索引
    temp=pop1(2,:);
    pop1(2,idx)=pop1(1,idx);
    pop1(1,idx)=temp(idx);
    pop2=pop1;
end