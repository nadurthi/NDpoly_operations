function Pnew=get_partial_polyND(P,xfix,fixedinds)
% P is the polynomial
% fixedinds are indicies of x that are fixed to given x value
% the remaining varaibles are in the exact same order

if length(xfix)~=length(fixedinds)
    error('xfix and fixedinds have to be same length')
end
ndim=size(P,2)-1;
remainids = 1:ndim;
remainids(fixedinds)=[];

nt=size(P,1);


Pnew = zeros(nt,length(remainids));
Pnew(:,1)=P(:,1);
for i=1:length(remainids)
   Pnew(:,1+i) = P(:,1+remainids(i));
end


xfix=xfix(:)';
Pnew(:,1)=Pnew(:,1).*prod(repmat(xfix,nt,1).^P(:,1+fixedinds),2);
Pnew=simplify_polyND(Pnew);



end