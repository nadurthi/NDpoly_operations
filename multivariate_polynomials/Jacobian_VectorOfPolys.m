function J=Jacobian_VectorOfPolys(Pfs)

d=size(Pfs{1},2)-1; % no. of variables or dim
n=size(Pfs,1);

J=cell(n,d);


for i=1:1:n
    for j=1:1:d
    J{i,j}=diff_polyND(Pfs{i},j);
    end
end




end