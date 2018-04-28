function LPs=InterpPoly(X)
% generate the interpolation polynomials each for one points
N=size(X,1);
dim=size(X,2);

% % no. of distinct points in each coordinate
% Xd=cell(dim,1);
% for d=1:1:dim
%     [B,I,J]=unique(round(X(:,d)*1e5)/1e5);
%     Xd{d}=X(I,d);
% end
Pf=cell(dim,1);
for d=1:1:dim
    Pf{d}=LagrangePoly1D(X(:,d),d,dim);
end

LPs=cell(N,1);
for i=1:1:N
    p=[1,zeros(1,dim)];
    for d=1:1:dim
        
        p1=Pf{d}{i};
        p=multiply_polyND(p,p1);
        
        
        
        
    end
    LPs{i}=p;
end

end

function Pf=LagrangePoly1D(X,nloc,dim)
% generate the 1 dim lagrange
% then place it into the given dimension location


% first find the unique points in X
[B,I,J]=unique(round(X*1e5)/1e5);   %use B(J)

P=cell(length(B),1);
for i=1:1:length(B)
    
    C=B;
    C(i)=[];
    pnum=poly(C);
    pdem=polyval(pnum,B(i));
    p=pnum/pdem;
    P{i}=zeros(length(pnum),dim+1);
    P{i}(:,1)=p;
    P{i}(:,nloc+1)=[length(p)-1:-1:0];
    
end
Pf=P(J);



end



