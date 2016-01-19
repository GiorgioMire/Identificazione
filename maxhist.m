function [ y ] = maxhist( v )

% for j=1:2
% i=kmeans(abs(v).',2);
% if min( sum(i==1),sum(i==2))<0.15*length(v)
% if sum(i==1)>sum(i==2)
%     v=v(i==1);
% else
%     v=v(i==2);
% end
% else
%     break
% end
%
 binsize=0.01*(2*iqr(v)*length(v))^(-1/3);
    if 0% ceil(range(v)/binsize)>10^5;

    [h,b]=hist(v);
    else
            [h,b]=hist(v,ceil(range(v)/binsize));
    end
    %[B,H]=histsmooth(b,h);
    B=b;
    H=h;
    [~,i]=max(H);
   figure
     bar(B,H./sum(H))
    
    y=B(i);
   

end

