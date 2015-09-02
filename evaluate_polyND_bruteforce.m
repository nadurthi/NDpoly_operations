function f=evaluate_polyND_bruteforce(P,x)
% evaluates the multidim polynomial P at x.
% care: dim of x has to be compatible with P
% P: first column is always coeff, rest of the columns are power of the
% x=x(:)';



nt=size(P,1);
C=P(:,1);
M=P(:,2:end);

[xr,xc]=size(x);
if xr==1 || xc==1
    x=x(:)';
end
if size(P,2)-1 ~= xc
    disp('dim mismatch in evaluate_polyND')
    f=NaN;
    return;
end

if length(x)~=size(M,2)
    disp('mismatch in poly and vector dims')
    f=NaN;
    return
end

f=0;

for i=1:1:size(M,1)  % the terms
    z=1;
    for j=1:1:size(M,2) % prod within the term
        z=z*x(j)^M(i,j);
    end
    f=f+C(i)*z;
end


end