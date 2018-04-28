function f=lagrange_evalpolyND(x,xi,fi)
%evaluate the lagrange polynomial at x defined by the points xi and func
%values fi
mx=length(fi);
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
DetMp=zeros(mx,1);

for i=1:1:mx
    Mp=M;
    for j=1:1:mx
         Mp(i,j)=evaluate_polyND(Pf{j},x);
    end 
    DetMp(i)=det(Mp);
end
fi=fi(:);
f=1/det(M)*sum(fi.*DetMp);

end