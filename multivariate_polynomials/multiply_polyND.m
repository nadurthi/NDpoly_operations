function P=multiply_polyND(P1,P2)
% c1=max(abs(P1(:,1)));
% c2=max(abs(P2(:,1)));
% 
% P1(:,1)=P1(:,1)/c1;
% P2(:,1)=P2(:,1)/c2;

% function to multiply 2 multidimensional polynomials
%first column is always coeff, rest of the columns are power of the
%variables

% [P1,P2]=equalizeDIM_polyND(P1,P2);


[m1,d]=size(P1);
[m2,d]=size(P2);
P=zeros(m1*m2,d);
k=1;

if m1<m2   % then rep m1
    
    for i=1:1:m2
        P(m1*(i-1)+1:i*m1,1)=(P1(:,1).*repmat(P2(i,1),m1,1));
        P(m1*(i-1)+1:i*m1,2:end)=(P1(:,2:end)+repmat(P2(i,2:end),m1,1));
        
    end
    
    
else
    
    for i=1:1:m1
        P(m2*(i-1)+1:i*m2,1)=(P2(:,1).*repmat(P1(i,1),m2,1));
        P(m2*(i-1)+1:i*m2,2:end)=(P2(:,2:end)+repmat(P1(i,2:end),m2,1));
        
    end
    
end


% for i=1:1:m1
%     for j=1:1:m2
%     P(k,2:end)=P1(i,2:end)+P2(j,2:end);
%     P(k,1)=P1(i,1)*P2(j,1);
%     k=k+1;
%     end
% end
%

% P(:,1)=(c1*c2)*P(:,1);

P=simplify_polyND(P);

end