function f=evaluate_polyND(P,x)
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
[xr,xc]=size(x);
if size(P,2)-1 ~= xc
    error('dim mismatch in evaluate_polyND')
    f=NaN;
    return;
end
f=zeros(size(x,1),1);
for i=1:1:size(x,1)
f(i)=sum(C.*prod(repmat(x(i,:),nt,1).^M,2));
end


end