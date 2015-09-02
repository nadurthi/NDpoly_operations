function [FF,f]=mefunk(Cvec,CrelMat,PHI,wint,y,M)
% Pf is the set of all basis polynomails
f=zeros(size(M,1),1);
FF=[];

for k=1:1:size(y,1)
%     
%     % first order moments
%     if sum(y(k,:))==1
%         i=find(y(k,:)==1);
%         f(k)=Cvec( CrelMat(i,1)  )-M(k);
%         continue
%     end

    % computing the expectation
    PP=1;
    for nn=1:1:length(y(k,:))
       c=Cvec( CrelMat(nn,:)  );
       c=c(:)';
       
       cc=0;
       for i=1:1:size(PHI,2)
          cc=cc+c(i)*PHI(:,i); 
       end
%        cc=sum( repmat(c,length(wint),1).*PHI , 2);

       
       try
       PP=PP.*((cc).^y(k,nn));
       catch
           keyboard
       end
    end
    f(k)=wint'*PP-M(k);
    
    
    
    
end