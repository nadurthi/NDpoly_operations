function Mainbody=GenMfile_MatrixOfPolys(Pf,fname,dir)
% generate a m-file with the function name in the directory dir


    

Mainbody='[';

if length(fname)>0
    fileID = fopen(strcat(dir,fname,'.m'),'w');
    fprintf(fileID,strcat('function f=',fname,'(x)\n'));
    fprintf(fileID,'f=');
end
for i=1:1:size(Pf,1)
    for j=1:1:size(Pf,2)
        P=Pf{i,j};
        ss='';
        for k=1:1:size(P,1)
            if P(k,1)>0
                ss=strcat(ss,'+',num2str(P(k,1),15));
            else
                ss=strcat(ss,num2str(P(k,1),15));
            end
            for d=2:1:size(P,2)
                if P(k,d)~=0
                    if P(k,d)~=1
                        ss=strcat(ss,'*','x(',num2str(d-1),')^',num2str(P(k,d)));
                    else
                        ss=strcat(ss,'*','x(',num2str(d-1),')');
                    end
                end
            end
            
        end
        Mainbody=strcat(Mainbody,ss);
%         fprintf(fileID,ss);
        
        if j<size(Pf,2)
            Mainbody=strcat(Mainbody,', ');
%             fprintf(fileID,', ');
        end
    end
    Mainbody=strcat(Mainbody,';\n');
%     fprintf(fileID,';\n');
end
Mainbody=strcat(Mainbody,']');

if length(fname)>0
    fprintf(fileID,Mainbody);
    fprintf(fileID,';');
    fclose(fileID);
    
end

Mainbody=strrep(Mainbody,'\n','');