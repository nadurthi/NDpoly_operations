function M=AddSubMultiply_MatrixOfPolys(M1,M2,op)
% M1 and M2 are matrix of polys i.e. cells



if strcmpi(op,'add')
    M=cell(size(M1));
    
    if isequal(size(M1),size(M2) )==0
        disp('dim of two matrix polys not the same')
        M=NaN;
        return
    end
    
    for i=1:1:size(M1,1)
        for j=1:1:size(M1,2)
            M{i,j}=add_sub_polyND(M1{i,j},M2{i,j},'add');
        end
    end
    
elseif strcmpi(op,'sub')
    M=cell(size(M1));
    
    if isequal(size(M1),size(M2) )==0
        disp('dim of two matrix polys not the same')
        M=NaN;
        return
    end
    
    for i=1:1:size(M1,1)
        for j=1:1:size(M1,2)
            M{i,j}=add_sub_polyND(M1{i,j},M2{i,j},'sub');
        end
    end
    
elseif strcmpi(op,'multiply')
    M=cell(size(M1,1),size(M1,2));
    
    if size(M1,2)~=size(M2,1)
        disp('dim of two matrix polys not the same')
        M=NaN;
        return
    end
    
    
    for i=1:1:size(M1,1)
        for j=1:1:size(M2,2)
            M{i,j}=zeros(1,size(M1{1,1},2));
            for k=1:1:size(M1,2)
            M{i,j}=add_sub_polyND(M{i,j},  multiply_polyND(M1{i,k},M2{k,j})  ,'add');  
            end
        end
    end
    
    
end
