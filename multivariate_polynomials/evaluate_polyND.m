function f=evaluate_polyND(P,x)
% evaluates the multidim polynomial P at x.
% care: dim of x has to be compatible with P
% P: first column is always coeff, rest of the columns are power of the
% x=x(:)';

% 
% P=vpa(P);
% x=vpa(x);

% f=evaluate_polyND2(P,x);
% return

%%
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
% prod(repmat(x(1,:),nt,1).^M,2)
f=zeros(size(x,1),1);
for i=1:1:size(x,1)
% f(i)=vpa(sum(C.*vpa(prod(vpa(repmat(x(i,:),nt,1).^M),2)) ));
f(i)=(sum(C.*(prod((repmat(x(i,:),nt,1).^M),2)) ));
% f(i)=vpa(sum(C.*prod(repmat(sym(x(i,:)),nt,1).^M,2) ));
end

% f
end