function M=ConvertMat_2_MatrixOfPolys(A,polydim_withoutcoeff)
% A is a regular matrix... convert into polynomial matrix
d=polydim_withoutcoeff;

M=cell(size(A));

for i=1:1:size(A,1)
    for j=1:1:size(A,2)
        M{i,j}=[A(i,j),zeros(1,d)];  % +1 for the coefficient
    end
end


