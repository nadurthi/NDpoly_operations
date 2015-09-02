function P=diff_polyND(P,n)
% differentiate the poly P with respect to the nth variable
ind=find(P(:,n+1)~=0);
ind0=find(P(:,n+1)==0);
P(ind,1)=P(ind,1).*P(ind,n+1);
P(ind,n+1)=P(ind,n+1)-1;
P(ind0,1)=0;

P(find(P(:,1)==0),:)=[];

P=simplify_polyND(P);
end