function P = update_or_insert_coeff_NDpoly(P,pws,c)
% where pws are the powers exponents

dim =size(P,2)-1;
p=0;
pws_idx=0;
for j=1:size(P,2)-1
    p=p+P(:,j+1)*10^(j-1);
    pws_idx = pws_idx + pws(j)*10^(j-1);
end

ind = find(p==pws_idx);
if isempty(ind)
    P=[P;[c,pws]];
else
    P(ind,1)=c;
end