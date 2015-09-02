function T=Simple_tens_prod_vec(u,v)
% 1 enitity is one row of any matrix u or v
% the rows of u are tensors producted with rows of v

n=size(u,1);
m=size(v,1);
T=[];
for i=1:1:n
    T=vertcat(T,horzcat(repmat(u(i,:),m,1),v));
end
