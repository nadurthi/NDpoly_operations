function S=symbolic_polyND(P)
[m,d]=size(P);
s=sym('s',[1,d-1]);
syms S
S=0;
for j=1:1:m
    M=P(j,1);
    for k=2:1:d
    M=M*s(k-1)^P(j,k);
    end
    S=S+M;
end
S=expand(S);

end