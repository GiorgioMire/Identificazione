function [ y ] = maxhist( v )

binsize=0.01*(2*iqr(v)*length(v))^(-1/3);
[h,b]=hist(v,ceil(range(v)/binsize));
[~,i]=max(h);

%    figure(174)
%    bar(B,H./sum(H))
    
    y=b(i);
    if isempty(y)
        [h,b]=hist(v);
        [~,i]=max(h);
        

    end
      figure
  bar(b,h./sum(h))
pause(0.001)
    y=b(i);
end

