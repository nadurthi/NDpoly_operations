function c = get_coeff_NDpoly(P,pws)
% where pws are the powers exponents
% get the coefficient of the term with powers pws
p=0;
pws_idx=0;
for j=1:size(P,2)-1
    p=p+P(:,j+1)*10^(j-1);
    pws_idx = pws_idx + pws(j)*10^(j-1);
end

ind = find(p==pws_idx);
if isempty(ind)
    c= 0;
else
    c= P(ind,1);
end