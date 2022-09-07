function d = d3(xyz1,xyz2)
%两节点对象的距离
    d=sqrt(sum((xyz1-xyz2).^2));
end