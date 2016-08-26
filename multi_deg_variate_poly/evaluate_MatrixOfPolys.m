function f=evaluate_MatrixOfPolys(Pfs,x)
% evaluates the multidim polynomial P at x.
% care: dim of x has to be compatible with P
% P: first column is always coeff, rest of the columns are power of the
% x=x(:)';

f=zeros(size(Pfs));

for i=1:1:size(f,1)
    for j=1:1:size(f,2)
        f(i,j)=evaluate_polyND(Pfs{i,j},x);
    end
end

end