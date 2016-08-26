function Pf=legendre_polyND(n,m)
%This function determines the legendre polynomial of dimension n and total
%degree 1 to m
% the output Pf will have the coefficients and the orders of each monomial
% as there are multiple moments for same degree, Pf is struct. First column
% is order combiantion and second column is moment combination
L=cell(m+1,1);
L{1}=[1,0];
L{2}=[1,1];
if n==1
    if m==0
       Pf=L{0};
       return
    elseif m==1
        Pf= L{1};
        return
    end
    for k=0:1:m-2
        P=multiply_polyND([1,1],L{k+1+1});
        P(:,1)=P(:,1)*(2*k+3)/(k+2);
        S=L{k+1};
        S(:,1)=S(:,1)*(k+1)/(k+2);
        L{k+2+1}=add_sub_polyND(P,S,'sub');
    end
    Pf=L{m+1};
   return 
end
Pf=cell(m,2);

for i=0:1:m
    
    
    P=multiply_polyND(P1,P2);
    
end




end