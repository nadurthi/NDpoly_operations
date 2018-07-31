function f=evaluate_polyND_sym(P,x)
% evaluates the multidim polynomial P at x.
% care: dim of x has to be compatible with P
% P: first column is always coeff, rest of the columns are power of the
% x=x(:)';

% 
% P=vpa(P);
% x=vpa(x);
dim = size(P,2)-1;

nt=size(P,1);
C=P(:,1);
M=P(:,2:end);

[xr,xc]=size(x);
if xr==1 || xc==1
    x=x(:)';
end
[xr,xc]=size(x);
if xr>1
    error('only row vec is allowed')
end

if size(P,2)-1 ~= xc
    error('dim mismatch in evaluate_polyND')
    f=NaN;
    return;
end
% prod(repmat(x(1,:),nt,1).^M,2)
f=0;
for i=1:1:nt
    p=C(i);
    for j=1:dim
        p=p*x(j)^M(i,j);
    end
    f=f+p;
end

% f
end