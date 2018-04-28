function y=MomentOrders(N,nx)
% N is the order or  highest degree
% nx is the number of variables

if N==0
    y=zeros(1,nx);
    return
end

combos = GenerateIndex(nx,(N+1)*ones(1,nx));
combos(find(combos==(N+1)))=0;

y=[];
for i=1:1:length(combos)
    if sum(combos(i,:))==N
     y=vertcat(y,combos(i,:));
    end
end
% y=sortrows(y,-1);
[~,ind]=sort(sqrt(sum(y.^2,2)));
y=y(ind,:);
end