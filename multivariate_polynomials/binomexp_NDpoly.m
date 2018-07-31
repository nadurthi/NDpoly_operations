function S=binomexp_NDpoly(P1,P2,n)
% get the poly (P1+P2)^n
% keyboard
if isempty(P1)==1 && isempty(P2)==0
    if size(P2,1)==1
        S=P2;
        S(1)=S(1)^(n);
        h=S(2:end);
        h = h * (n);
        S(2:end)=h;
    else
        S=binomexp_NDpoly(P2(1,:),P2(2:end,:),n);
    end
    return
end
if isempty(P1)==0 && isempty(P2)==1
    if size(P1,1)==1
        S=P1;
        S(1)=S(1)^(n);
        h=S(2:end);
        h = h * (n);
        S(2:end) = h;
    else
        S=binomexp_NDpoly(P1(1,:),P1(2:end,:),n);
    end
    return
end

dim=size(P1,2)-1;
if n==0
    S= [1,zeros(1,dim)];
    return
end

S=zeros(1,dim+1);
for i=0:n
    s=nchoosek(n,i);
    if size(P1,1)==1
        if n-i==0
            p1=[1,zeros(1,dim)];
        else
            p1=P1;
            p1(1)=p1(1)^(n-i);
            h=p1(2:end);
            h = h * (n-i);
            p1(2:end) = h;
        end
    else
        p1 = binomexp_NDpoly(P1(1,:),P1(2:end,:),n-i);
    end
    
    if size(P2,1)==1
        if i==0
            p2=[1,zeros(1,dim)];
        else
            p2=P2;
            p2(1)=p2(1)^(i);
            h = p2(2:end);
            h = h * (i);
            p2(2:end) = h;
        end
    else
        p2 = binomexp_NDpoly(P2(1,:),P2(2:end,:),i);
    end
    p=multiply_polyND(p1,p2);
    p = scalar_multiply_polyND(s,p);
    S=add_sub_polyND(S,p,'add');
end
S=simplify_polyND(S);