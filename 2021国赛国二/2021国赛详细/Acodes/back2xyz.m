function xyz = back2xyz(d,xyz0,unit_vec)
%d是列向量
    xyz=xyz0-d.*unit_vec;
end