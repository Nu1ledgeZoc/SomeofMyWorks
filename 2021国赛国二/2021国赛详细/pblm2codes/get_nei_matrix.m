clear;
load('pv.mat');
load('idx.mat');
pv_graph=zeros(4300,3);
%��һ��ֻ��������ڽӣ�ʵ��ʹ��ʱ�����漰�߽磬���ֻ�����߱��������㷨�������

    for i = 1:4300
        i
        v1=pv.VarName1(i);
        v2=pv.VarName2(i);
        v3=pv.VarName3(i);
         for k = 1:2226
             if idx{k}==v1
                 pv_graph(i,1)=k;
             end
             if idx{k}==v2
                pv_graph(i,2)=k;
             end
             if idx{k}==v3
                pv_graph(i,3)=k;
             end
         end
    end

