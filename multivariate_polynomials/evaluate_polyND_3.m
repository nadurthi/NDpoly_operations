function f=evaluate_polyND_3(P,x)
% evaluates the multidim polynomial P at x.
% care: dim of x has to be compatible with P
% P: first column is always coeff, rest of the columns are power of the
% x=x(:)';

%
% P=vpa(P);
% x=vpa(x);

% f=evaluate_polyND2(P,x);
% return

%%
nt=size(P,1);
C=P(:,1);
M=P(:,2:end);

[xr,xc]=size(x);
if xr==1 || xc==1
    x=x(:)';
end
[xr,xc]=size(x);
if size(P,2)-1 ~= xc
    error('dim mismatch in evaluate_polyND')
    f=NaN;
    return;
end
% prod(repmat(x(1,:),nt,1).^M,2)
f=zeros(size(x,1),1);
% keyboard
for i=1:1:size(x,1)
    
    SS=[C,repmat(x(i,:),nt,1).^M];
    pq = prod(SS,2);
    S1 = SS(abs(pq)<15,:);
    S = SS(abs(pq)>=15,:);
    if isempty(S)==0
        Signs = prod(sign(S),2);
        S = abs(S);
        Slog = log(S);
        Ssumlog = sum(Slog,2);
        G=[Signs,Ssumlog];

        Gp1 = G(G(:,1)==1,:);
        Gm1 = G(G(:,1)==-1,:);

        Gp1=sortrows(Gp1,2,'descend');
        Gm1=sortrows(Gm1,2,'descend');
        Gmod = zeros(size(G,1),2);
        Gmod(2*[1:size(Gp1,1)]-1,: ) = Gp1;
        Gmod(2*[1:size(Gm1,1)],: ) = Gm1;
        Gmod(sum(abs(Gmod),2)==0,:)=[];
%         cm = mean(Gmod(:,2));
%         Gmod(:,2)= Gmod(:,2) -repmat(cm,length(Gmod(:,2)),1);
    %     f(i) = vpa(sum(Gmod(:,1).*sym(exp(Gmod(:,2)))) );
        g=[0,0];
        for j=1:size(Gmod,1)
            g=addexpterms(Gmod(j,2),g(2),Gmod(j,1),g(1));
        end
        if abs(g(2))<=20
            f(i) = g(1)*exp(g(2));
        else
            f(i)=vpa(g(1)*exp(sym(g(2))));
        end
    end
    f(i) = f(i) + sum(prod(S1,2));
end