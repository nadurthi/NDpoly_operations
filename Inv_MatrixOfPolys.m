function [Madj,Mdet]=Inv_MatrixOfPolys(M)
% Inverse of poly mat
Mdet=Det_MatrixOfPolys(M);



Madj=cell(size(M));

for i=1:1:size(M,1)
    for j=1:1:size(M,2)
        P=M;
        P(i,:)=[];
        P(:,j)=[];
        
        Madj{i,j}= scalar_multiply_polyND((-1)^(i+j) ,Det_MatrixOfPolys(P));
    end
end