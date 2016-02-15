function plotp(v,realval)
[h,b]=hist(v,min(v)-1:max(v)+1);
bar(b,h./sum(h))
line([realval realval],[0,max(h./sum(h))+0.1], 'Color','g','LineWidth',2)
end