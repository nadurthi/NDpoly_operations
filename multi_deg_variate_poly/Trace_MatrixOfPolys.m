function d=Trace_MatrixOfPolys(M)

polydim=size(M{1,1},2);
% M is a matrix of polynomaisl
m=size(M,1);
if size(M,1)~=size(M,2)
    disp('Poly Moatrix si not square')
    d=NaN;
    return
end

d=zeros(1,polydim);
for i=1:1:size(M,1)
    d=add_sub_polyND(d, M{i,i},'add');
end



