clear;
clc
%第三问的求解在新坐标系下
load('pv_graph.mat')
load('xyz0.mat')
load('unit_vec.mat')
load('best_b.mat')
load('indiv_addr.mat')
load('xyz_best.mat')%新坐标系下，最优的节点位置，转换到原坐标系后，为xyz_best_transback
    b=best_b;
    dhat_all=cal_dhat_all(b,indiv_addr,xyz0);
    xyz_best=xyz0-dhat_all.*unit_vec;
    r=3.004000111215428e+02;
    z=150^2/(4*(b-(1-0.466)*r))-b;%照明面边缘z值
    l=sqrt((z+b)^2+150^2)+0.2;
    
    v_c1=pv_graph(:,1);
    v_c2=pv_graph(:,2);
    v_c3=pv_graph(:,3);
    xyz_c1=xyz0(v_c1,:);
    xyz_c2=xyz0(v_c2,:);
    xyz_c3=xyz0(v_c3,:);
    dingdian=repmat([0 0 -b],length(v_c1),1);
    l_mat=repmat(l,length(v_c1),1);
    l_c1=sqrt(sum((xyz_c1-dingdian).^2,2));
    l_c2=sqrt(sum((xyz_c2-dingdian).^2,2));
    l_c3=sqrt(sum((xyz_c3-dingdian).^2,2));
    a1=l_c1<=l_mat;
    a2=l_c2<=l_mat;
    a3=l_c3<=l_mat;
    addr=a1.*a2.*a3;
    idxp=find(addr);%得到照射面内反射面的索引
    
    icount=0;
    points_in=zeros(4300,3);
    %求解接收率
    for index = 1:length(idxp)
        v_set=pv_graph(idxp(index),:);
        v1=xyz_best(v_set(1),:);
        v2=xyz_best(v_set(2),:);
        v3=xyz_best(v_set(3),:);

        rule_vec=cross(v1-v2,v1-v3);
        if rule_vec(3) < 0
            %这里不考虑垂直等特殊情况
            rule_vec=-rule_vec;
        end

        rule_vec=rule_vec./norm(rule_vec);

        cos_theta=rule_vec(3);
        xyz_R=(v1+v2+v3)./3;
        %xyz_R=v1;
        if 1-cos_theta <= 1e-6
            icount=icount+1;
            continue;
        end

        line_xyz=[rule_vec(1) rule_vec(2) 1-rule_vec(2)/rule_vec(3)*(rule_vec(1)^2/rule_vec(2)+rule_vec(2))];
        line_xyz=line_xyz./norm(line_xyz);
        t=-(0.534*3.004000111215428e+02+xyz_R(3))/line_xyz(3);
 
        
        points_in(index,:)=[xyz_R(1)+line_xyz(1)*t,xyz_R(2)+line_xyz(2)*t,xyz_R(3)+line_xyz(3)*t]./145;
        jud=((xyz_R(1)+line_xyz(1)*t)/145)^2+((xyz_R(2)+line_xyz(2)*t)/145)^2;
        if jud<=0.25
            icount=icount+1;
        end
    end
        rate_para=icount/length(idxp);
        
        hold on
       
        %%
        icount0=0;
        for index = 1:4300

        v_set=pv_graph(index,:);
        v1=xyz0(v_set(1),:);
        v2=xyz0(v_set(2),:);
        v3=xyz0(v_set(3),:);

        rule_vec=cross(v1-v2,v1-v3);
        if rule_vec(3) < 0
            %这里不考虑垂直等特殊情况
            rule_vec=-rule_vec;
        end

        rule_vec=rule_vec./norm(rule_vec);

        cos_theta=rule_vec(3);
        xyz_R=(v1+v2+v3)./3;
        %xyz_R=v1;
        if 1-cos_theta <= 1e-6
            icount0=icount0+1;
            continue;
        end

        line_xyz=[rule_vec(1) rule_vec(2) 1-rule_vec(2)/rule_vec(3)*(rule_vec(1)^2/rule_vec(2)+rule_vec(2))];
        line_xyz=line_xyz./norm(line_xyz);
        t=-(0.534*3.004000111215428e+02+xyz_R(3))/line_xyz(3);
 
        
        points_in(index,:)=[xyz_R(1)+line_xyz(1)*t,xyz_R(2)+line_xyz(2)*t,xyz_R(3)+line_xyz(3)*t]./145;
        jud=((xyz_R(1)+line_xyz(1)*t)/145)^2+((xyz_R(2)+line_xyz(2)*t)/145)^2;
        if jud<=0.25
            icount0=icount0+1;
        end
        end
        rate_para2=icount0/4300;
         scatter3(xyz0(:,1),xyz0(:,2),xyz0(:,3),100,xyz0(:,3).^2,'.');
        scatter3(points_in(:,1),points_in(:,2),points_in(:,3),100,'.');
        