function M=PolyMultiply_MatrixOfPolys(p,M,locs)
% multiply a poly with a matrix of polys
% loc is the matrix entries to multipl y the scalar
% locs= [ [r,c], [r,c] , [r,c]   ......  ]
% use [T,W]=tens_prod_vec(a',b',a',b') to get all the locs from two vectors


if strcmpi(locs,'All')
    
    for i=1:1:size(M,1)
        for j=1:1:size(M,2)
            M{i,j}=multiply_polyND(p,M{i,j});
        end
    end
    
else
    if size(locs,2)>2
        disp('locs have 2 cols')
        M=NaN;
        return
    end
    
    for k=1:1:size(locs,1)
        
        i=locs(k,1);
        j=locs(k,2);
        M{i,j}=multiply_polyND(p,M{i,j});
        
    end
end
