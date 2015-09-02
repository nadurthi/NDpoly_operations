function M=Dummy_MatrixOfPolys(type,rows,cols,polydim_withoutcoeff)

d=polydim_withoutcoeff;

M=cell(rows,cols);
if strcmpi(type,'zeros')
    for i=1:1:rows
        for j=1:1:cols
            M{i,j}=zeros(1,d+1);  % +1 for the coefficient
        end
    end
    
    
elseif strcmpi(type,'scalar_ones')
    for i=1:1:rows
        for j=1:1:cols
            M{i,j}=[1,zeros(1,d)];  
        end
    end
    
end