function Pf=LegendreBasis_polyND(n,m)
% n is dim
% m is the order upto
%Generate tje legendre polynomials upto certain order

%first 10 legendre polynomails
Plegendre1D=cell(8,1);
Plegendre1D{1}=[1,0];
Plegendre1D{2}=[1,1];
Plegendre1D{3}=[3/2,2;
               -1/2,0];
Plegendre1D{4}=[5/2,3;
               -3/2,1];
Plegendre1D{5}=[35/8,4;
               -30/8,2;
                3/8,0];
Plegendre1D{6}=[63/8,5;
               -70/8,3;
                15/8,1];
Plegendre1D{7}=1/16*[231,6;
               -315,4;
                105,2;
                -5,0 ];
Plegendre1D{8}=1/16*[429,7;
               -693,5;
                315,3;
                -35,1 ];
            
Pf=cell(nchoosek(n+m,m),1);
if m==0
    return
end
k=1;
for N=0:1:m
    y=MomentOrders(N,n);
    for p=1:1:size(y,1)
        P=[1,zeros(1,n)];
        for j=1:1:n
            P2=zeros(size(Plegendre1D{y(p,j)+1},1),n+1);
            P2(:,1)=Plegendre1D{y(p,j)+1}(:,1);
            P2(:,j+1)=Plegendre1D{y(p,j)+1}(:,2);
%             keyboard
            P=multiply_polyND(P,P2);        
        end
        Pf{k}=P;
        k=k+1;
    end
end