function [FF,f]=mefunk2(Cvec,CrelMat,PHI,wint,y,M)
% Pf is the set of all basis polynomails
f=zeros(size(M,1),1);
FF=[];

Cpoly_exp=zeros(1,1+length(Cvec));



for k=1:1:size(y,1)
    
    for s=1:1:length(wint)

        PP=zeros(length(cind),1+length(Cvec));
        PP(1)=1;
        for nn=1:1:length(y(k,:))
            cind=CrelMat(nn,:);
            Cpoly=zeros(length(cind),1+length(Cvec));
            for i=1:1:length(cind)
                Cpoly(i,1)=PHI(s,i);
                Cpoly(i,1+cind(i))=1;
            end
            Cpoly=tothepowerof_polyND(Cpoly,y(k,nn));
            PP=multiply_polyND(PP,Cpoly);
        end
       
        PP=scalar_multiply_polyND(wint(s),PP);
        Cpoly_exp=add_sub_polyND(Cpoly_exp,PP,'add');
    end
    
    % evaluating the polynomials at the current Cvec
    nt=size(Cpoly_exp,1);
    C=Cpoly_exp(:,1);
    M=Cpoly_exp(:,2:end);
    pp=0;
    for i=1:1:nt
        d=1;
        for j=1:1:length(Cvec)
           d=d*Cvec(j)^M(i,j); 
        end
        pp=pp+C(i)*d;
    end
    f(k)=pp-M(k);
    
end

