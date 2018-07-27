function P=get_gauss_quad_poly(m,pcov)
dim = length(m);
m=m(:);
% given a mean and cov get the corresponding poly p(x) 
% A=inv(P)
% -0.5*(x-mu)'*A*(x-mu) = -0.5*( x'Ax-2x'Amu+mu'Amu )
A=inv(pcov);

% find the new x1 and x2
Px=cell(dim,1);
II=eye(dim);
for i=1:dim
    Px{i}=[1,II(i,:)];
end

%first multiple A with x
AP=cell(dim,1);
for i=1:dim
   p=[0,zeros(1,dim)];
   for j=1:dim
       p1=scalar_multiply_polyND(A(i,j),Px{j});
       p=add_sub_polyND(p,p1,'add');
   end
   AP{i}=p;
   
end
P1=[0,zeros(1,dim)];
for i=1:dim
    p1=multiply_polyND(Px{i},AP{i});
    P1=add_sub_polyND(P1,p1,'add');
end
d=A*m(:);
P2=[0,zeros(1,dim)];
for i=1:dim
    p1=scalar_multiply_polyND(d(i),Px{i});
    P2=add_sub_polyND(P2,p1,'add');
end
P2=scalar_multiply_polyND(-2,P2);
P=add_sub_polyND(P1,P2,'add');

c=m'*A*m;
P=add_sub_polyND([c,zeros(1,dim)],P,'add');
P=scalar_multiply_polyND(-0.5,P);


cexp = log(1/sqrt(det(2*pi*pcov)));
c0 = get_coeff_NDpoly(P,zeros(1,dim));
P = update_or_insert_coeff_NDpoly(P,zeros(1,dim),c0+cexp);











