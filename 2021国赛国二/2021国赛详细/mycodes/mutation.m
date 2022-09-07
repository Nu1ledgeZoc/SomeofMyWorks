function newpop = mutation(mypop)
[pop_num,chrom_len]=size(mypop);
p_mutation=0.005;
global max_para min_para;

for i1 = 1:pop_num
    if rand < p_mutation
        addr=randi([0 1],1,chrom_len);
        l=sum(addr);
        addr= addr==1;
        mypop(i1,addr)=min_para(addr)+(max_para(addr)-min_para(addr)).*rand(1,l);
    end    
end
    newpop=mypop;
end