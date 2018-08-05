function f=addexpterms(z1,z2,s1,s2)
% s1 and s2 are sign terms
% s1*exp(z1)+s2*exp(z2)
% thres1 = 10;
% q1=floor(z1/thres1);
% r1=z1-thres1*q1;
% 
% q2=floor(z2/thres1);
% r2=z2-thres1*q2;
% 
% cq = min(q1,q2);
% z1 = z1 - thres1*cq;
% z2 = z2 - thres1*cq;

z = min(z1,z2);
z1 = z1 - z;
z2 = z2 - z;

thres = 30;

if z1+z2 <= thres
    p=s1*exp(z1) + s2*exp(z2);
    f = [sign(p),log(abs(p))];
    f(2) = z+f(2); 
else % abs(z1) > thres && abs(z2) > thres
%     [z1,z2,s1,s2]
    f=zeros(1,2);
    f(1) = sign(s1*z1+s2*z2);
    if z1==0
        f(2) = vpa( log( abs(s1+s2*exp(sym(z2))) ) );
    else
        f(2) = vpa( z+log( abs(s1*exp(sym(z1) )+s2) ) );
    end
end
    
   
    