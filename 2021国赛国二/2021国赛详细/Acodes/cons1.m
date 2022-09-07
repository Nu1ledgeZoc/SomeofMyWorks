function max_rate= cons1(d_now,xyz0,unit_vec,pv_graph)
    %这里程序对每个面的三边执行判断，查看最大的距离变化率
    
    
    xyz=back2xyz(d_now,xyz0,unit_vec);
    v_c1=pv_graph(:,1);
    v_c2=pv_graph(:,2);
    v_c3=pv_graph(:,3);
    xyz_c1=xyz(v_c1,:);
    xyz_c2=xyz(v_c2,:);
    xyz_c3=xyz(v_c3,:);
    xyz0_c1=xyz0(v_c1,:);
    xyz0_c2=xyz0(v_c2,:);
    xyz0_c3=xyz0(v_c3,:);
    di=[sqrt(sum((xyz_c1-xyz_c2).^2,2)) sqrt(sum((xyz_c3-xyz_c2).^2,2)) sqrt(sum((xyz_c1-xyz_c3).^2,2))];
    d0i=[sqrt(sum((xyz0_c1-xyz0_c2).^2,2)) sqrt(sum((xyz0_c3-xyz0_c2).^2,2)) sqrt(sum((xyz0_c1-xyz0_c3).^2,2))];
    max_rate=max(abs((di-d0i)./d0i),[],'all');
end

