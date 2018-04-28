function p = get_line_poly(P,a,b)
% here x1 = a(1)*t+b(1)
% x2 = a(2)*t+b(2)
% x3 = a(3)*t+b(3)

% then return a poly in t
dim=size(P,2)-1;
p=0;
for i = 1:size(P,1)
    c=P(i,1);
    p1=[1];
    for j=1:dim
        pc=[a(j),b(j)];
        pc=poly_pow(pc,P(i,j+1));
        p1=conv(p1,pc);
    end
    p1=c*p1;
    
    p=p+p1;
    
end