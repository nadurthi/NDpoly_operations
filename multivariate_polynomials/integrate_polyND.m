function integrate_polyND(P,RangeUB,RangeLB)
% integrate the polynomial in the rectangular region defined by the
% opposite corners RangeLB,RangeUB (vectors)
% RangeLB<= x <= RangeUB ... to be interpreted as element wise inequality
% for these vectors
[m,n]=size(P)
n=n-1; %the dimension or number of variabels
% m is the number of monomials

[ nodes, weights ] = nwspgr_mod ('kpu',n, k )
















