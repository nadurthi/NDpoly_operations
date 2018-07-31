function P1=simplify_polyND(P1)
% function to simplify multidimensional polynomials
%first column is always coeff, rest of the columns are power of the
%variables. Thisfunction just clubs to together the coeff of same monomials
P1(P1(:,1)==0,:)=[];
if isempty(P1)==1
    P1=zeros(1,size(P1,2));
end



% P1=sortrows(P1);

pdeg=size(P1,2)-1;
p=0;
for j=1:1:pdeg
    p=p+P1(:,j+1)*10^(pdeg-j);
end

if length(p)~=length(unique(p))
    for m=unique(p)'
        ind=find(p==m);
        P1(ind(1),1)=(sum(P1(ind,1)));
        P1(ind(2:end),1)=0;
    end
    
end



P1(P1(:,1)==0,:)=[];
if isempty(P1)==1
    P1=zeros(1,size(P1,2));
end

cols=2:(size(P1,2)-1);
P1=sortrows(P1,cols);

% [m1,d]=size(P1);
% P=P1(1,:);
% k=2;
% for i=2:1:m1
%        ind=[];
%        kn=size(P(:,2:end),1);
%        S=P(:,2:end)-repmat(P1(i,2:end),kn,1);
%        ind=find(sum(abs(S),2)==0);
%
%        if isempty(ind)
%        P(k,:)=P1(i,:);
%        k=k+1;
%        else
%            P(ind(1),1)=P(ind(1),1)+P1(i,1);
%        end
%
% end
% P(find(P(:,1)==0),:)=[];
% if isempty(P)==1
%     P=zeros(1,size(P,2));
% end