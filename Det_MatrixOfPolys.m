function d=Det_MatrixOfPolys(M)

polydim=size(M{1,1},2);
% M is a matrix of polynomaisl
m=size(M,1);
if size(M,1)~=size(M,2)
    disp('Poly Moatrix si not square')
    d=NaN;
    return
end

if m==2
    d=  add_sub_polyND(multiply_polyND(M{1,1},M{2,2})  ,  multiply_polyND(M{1,2},M{2,1})  ,'sub')  ;

elseif m==1
    d=M{1,1};
    
elseif m<=2 && m>2  % just use leibniz rule
    
    P = perms(1:m);

    II=eye(m);
    
    d=zeros(1,polydim);
    for n=1:1:size(P,1)
        p=[1,zeros(1,polydim-1)];
        for i=1:1:m
            p=multiply_polyND( p  ,  M{i,P(n,i)}  );
            
        end
       
        d=add_sub_polyND(d,  scalar_multiply_polyND(  det(II(P(n,:),:) ) , p ) ,'add');
        
        
    end
    
else

    d=zeros(1,polydim);
    for j=1:1:m
        B=M;
        B(1,:)=[];
        B(:,j)=[];
        d=add_sub_polyND(d,  multiply_polyND( scalar_multiply_polyND(  (-1)^(j+1)  , M{1,j} ),  Det_MatrixOfPolys(B)  ) ,'add');

    end
    
end



