function pop2 = cross_over(pop1)
    %�����彻�棬������������Ⱥ
    [~,c]=size(pop1);   
    c2=randi(c);%���ɽ������Ϊ�����c2��
    idx=randperm(c,c2);%0-c��Χ�ڵ������������c2����Ϊ����
    temp=pop1(2,:);
    pop1(2,idx)=pop1(1,idx);
    pop1(1,idx)=temp(idx);
    pop2=pop1;
end