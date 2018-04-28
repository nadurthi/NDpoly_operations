function Pf=tothepowerof_polyND(P,n)

% take the nth power of the ND polynomail



Pf=zeros(1,size(P,2));
Pf(1)=1;

if n==0
    return;
end

if n==1
    Pf = P;
    return;
end

for i=1:1:n
    Pf=multiply_polyND(Pf,P);
    
    
end