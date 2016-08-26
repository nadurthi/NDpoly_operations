function P=add_sub_polyND(P1,P2,type)
% add P1+P2 or sub P1-P2

switch lower(type)
    case 'add'
        P=[P1;P2];
        P=simplify_polyND(P);
    case 'sub'
        P2(:,1)=-P2(:,1); % as first col are coefficients
        P=[P1;P2];
        P=simplify_polyND(P);
    otherwise
        disp('type not known in add_sub_poly')
        P=NaN;
end