function popultn = crt_pop(n,pop_size,encode_mode)
%输入参数，个体染色体长度，种群大小，编码方式
%输出, 种群
%需要约束的要加入约束
global min_para max_para;

%如果是二进制编码，分别设置小数位和整数位的表示位数
inte_bits=64;
float_bits=16;
rng(sum(clock));
switch encode_mode
case 1
%二进制编码
    % popultn=[randi([0 1],popsize,inte_bits) randi([0 1],popsize,float_bits)];
    % flag=popultn(:,1:inte_bits);
    % while condition
        
    % end
case 2
%实数编码
    popultn=minpara+(max_para-min_para).*rand(pop_size,n);
end
    
end