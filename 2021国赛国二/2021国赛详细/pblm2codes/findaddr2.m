%unit_vec=xyz0./sqrt(sum(xyz0.^2,2));
%%
%验证addr不变
%利用照射面半径条件，缩小决策变量维度

clear
load('unit_vec.mat')
load('xyz0.mat')
load('indiv_addr.mat')
load('pv_graph.mat')
searAccur_b=0.00001;%搜索精度
step_len=6000000000;%搜素总步长
b_min=300.7;
b_max=300.8;
k=1;
for i = 1:step_len
    b=b_min+i*searAccur_b
%     
%     icount=1;
%     for j = 1:2226%判断，在照射面以内的选择为决策变量
%         ggggggg=xyz0(j,:);
%         iflag=lim_l(ggggggg,b);
%         if iflag==1
%             indiv_addr(icount)=j;
%             %disp('y')
%             icount=icount+1;
%         end
%     end    
%     clear j;
%     %得到染色体长度,也即实际的控制变量个数
%     chrom_len=icount-1;
%     clear icount ggggggg iflag;
%     if i>=2
%         len1=length(temp_addr);
%         if len1~=chrom_len
%             break;
%         end
%         logi= temp_addr==indiv_addr;
%         logi=sum(~logi);
%         if logi~=0
%             break;
%         end
%     end
%     temp_addr=indiv_addr;
%     %若实际决策变量始终不变，则退出时b应为301


      %现阶段b所对应的理想伸缩量
    dhat_now=cal_dhat_all(b,indiv_addr,xyz0);

%     a1= abs(dhat_now) <= repmat(0.6, 2226,1);
% 
%     jud1=sum(~a1);%should be 0
    max_rate(i)=cons1(dhat_now,xyz0,unit_vec,pv_graph);%0.0007
    if i~=1 && max_rate(i)<max_rate(i-1)
        best_rate=max_rate(i);   
        best_b=b;
    end
    if b>=b_max
        break;
    end
    
end
% len=length(max_rate);
% plot(linspace(b_min,b_max,len),max_rate);
