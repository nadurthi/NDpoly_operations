[xi,wi]=conjugate_dir_gausspts_till_6moment_scheme2(zeros(2,1),eye(2));
Pfnew=lagrange_polyND(xi,wi);

[xx,yy]=meshgrid(-5:0.1:5);
pp=zeros(size(xx));

for i=1:1:size(xx,1)
    for j=1:1:size(xx,2)
% pp(i,j)=lagrange_evalpolyND([xx(i,j),yy(i,j)],xi,wi);
pp(i,j)=evaluate_polyND(Pfnew,[xx(i,j),yy(i,j)]);
    end
end

mesh(xx,yy,pp)
hold on
plot3(xi(:,1),xi(:,2),wi,'bo','linewidth',3,'MarkerSize',6)
alpha 0.4


[xint,wint] = GLeg_pts([10,10,10], [-1,-1,-1], [1,1,1]);


Pf=LegendreBasis_polyND(3,3);
f=evaluate_polyND(multiply_polyND(Pf{1},Pf{1}),xint);
Intg=wint'*f

%% Lorenz example
S=10;
R=28;
B=8/3;

dS=[9.8,10.5];
dR=[27.5,28.5];
nX=3;
% p1-S
% p2-R
F=@(p)ode45(@(t,x)[p(1)*(x(2)-x(1));p(2)*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-B*x(3)],[0:1:5],[1.5088,-1.531271,25.46091]);


[xint,wint] = GLeg_pts([10,10], [dS(1),dR(1)], [dS(2),dR(2)]);

Xf=zeros(size(xint,1),nX);
for i=1:1:length(wint)
[t,x]=F([xint(i,1),xint(i,2)]);
Xf(i,:)=x(end,:);
end

[y1,M1]=Cal_moments_samples(Xf,wint,1,'raw');
[y2,M2]=Cal_moments_samples(Xf,wint,2,'raw');
[y3,M3]=Cal_moments_samples(Xf,wint,3,'raw');
[y4,M4]=Cal_moments_samples(Xf,wint,4,'raw');

mm=4;
Pf=LegendreBasis_polyND(nX,mm);

Ccols=length(Pf);
Crows=3;
C=zeros(Crows,Ccols);
% C(:,1)=M1';

y=[y1;y2];
M=[M1;M2];

N=ceil((mm+1)/2)+4;
[xM,wM] = GLeg_pts(N*ones(1,size(y,2)), -1*ones(1,size(y,2)), ones(1,size(y,2)));

% evaluating the poly basis at these points: each row is for 1 sigma  point
%  PHI=[phi1,ph2,...; phi1,phi2,... ]
PHI=zeros(length(wM),length(Pf));
for i=1:1:length(Pf)
PHI(:,i)=evaluate_polyND(Pf{i},xM);
end

CrelMat=zeros(nX,length(Pf));
k=1;
for i=1:1:nX
    for j=1:1:length(Pf)
        CrelMat(i,j)=k;
        k=k+1;
    end
end


options=optimset('disp','iter','TolCon',1e-8,'MaxFunEvals',1e5,'MaxIter',1e5,'TolFun',1e-8,'TolX',1e-8);
Cvec =   fmincon(@(Cvec)norm(Cvec),rand(nX*length(Pf),1),[],[],[],[],[],[],@(Cvec)mefunk(Cvec,CrelMat,PHI,wM,y,M),options)



Cvec =  lsqnonlin(@(Cvec)mefunk(Cvec,CrelMat,PHI,wM,y,M),rand(nX*length(Pf),1),[],[],options);


% CVX approach
AA=PHI'*diag(wM)*PHI;
nm=length(Pf);
[mz,Pz]=MeanCov(Xf,wint);
cvx_begin 
    variable C(nX,nm)
    minimize(norm(C*ones(nm,1)))
    subject to
        C*AA*C'-Pz>=0
        C(1,1)==mz(1)
        C(2,1)==mz(1)
        C(3,1)==mz(1)
       
cvx_end


%%Gloptipoly approach
mpol C 3 35
g=mefunk(C,CrelMat,PHI,wM,y,M)
pause % Strike any key to continue.

% Then we define the optimization problem

P = msdp(min(g0))


% Once the moment problem is modeled, a semidefinite solver can be used to
% solve it numerically with the command [status,obj] = msol(P)

[status,obj] = msol(P)                       

% This means that the moment problem is solved successfully
% that GloptiPoly can extract two globally optimal
% solutions reaching the objective function: 

C = double(C);







[c1,c2]=meshgrid(-5:0.2:5);
% c=[c1(:),c2(:)];
% z=c(:,1).^2.*c(:,2).^2;
z=zeros(size(c1));
for i=1:1:size(c1,1)
    for j=1:1:size(c1,2)
   z(i,j)=c1(i,j)^2*c2(i,j)^2;     
    end
end
contour(c1,c2,z,100)



