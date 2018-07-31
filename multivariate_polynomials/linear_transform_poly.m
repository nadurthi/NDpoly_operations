function AP=linear_transform_poly(P,A,b)
dim = size(P,2)-1;


% given a poly p(x) find p(Ay+b) or p(y)
% x = Ay+b
% x1=a11 y1+ a12 y2+ ... a1n yn + b1
% x2=a21 y1+ a22 y2+ ... a2n yn + b2

% find the new x1 and x2
Px=cell(dim,1);
for i=1:length(b)
    C=[b(i),zeros(1,dim);A(i,:)',eye(dim)];
    Px{i}=C;
end
% keyboard

AP=zeros(1,dim+1);
for i=1:size(P,1)
    c=P(i,1);
    powers = P(i,2:end);
    p=[1,zeros(1,dim)];
    for j=1:length(powers)
        p1=tothepowerof_polyND(Px{j},powers(j)) ;
        p=multiply_polyND(p,p1);
    end
    p=scalar_multiply_polyND(c,p);
    AP=add_sub_polyND(AP,p,'add');
    AP=simplify_polyND(AP);
end

AP=simplify_polyND(AP);

%% testing
% p1=simplify_polyND(p1);
% evaluate_polyND(Px{1},[1,1,2])^5
% evaluate_polyND(p1,[1,1,2])
% evaluate_polyND(p,[1,1,2])
