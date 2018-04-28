function PP=lagrange_polyND(xi,fi)
%This function determines the lagrange polynomial
% the output Pf will have the coefficients and the orders of each monomial
% xi is a matrix with rows as number of points and columns as dim
mx=size(xi,1);
n=size(xi,2);
for m=0:2:mx
    Pf=Basis_polyND(n,m);
    if length(Pf)>=mx
        break;
    end
end
Pf(mx+1:end)=[];

M=zeros(mx,mx);
% Mp=cell(mx,1);
for i=1:1:mx
    for j=1:1:mx
        M(i,j)=evaluate_polyND(Pf{j},xi(i,:));
    end
end

Pfnew=cell(length(Pf),1);
for i=1:1:mx
    Pfnew{i}=zeros(1,n+1);
    for j=1:1:mx
        C=Cofactor(M,mx,i,j);
        try
            Pfnew{i}=add_sub_polyND(Pfnew{i},scalar_multiply_polyND(C/det(M),Pf{j}),'add');
        catch
            keyboard
        end
    end
end
if sum(isnan(fi))==0
    PP=zeros(1,n+1);
    for i=1:1:length(Pfnew)
        PP=add_sub_polyND(PP,scalar_multiply_polyND(fi(i),Pfnew{i}),'add');
    end
else
    PP=Pfnew;
end
end