for i=1:100
    x(i)=campionaInvGamma(1,2);
end
figure
[h,b]=hist(x,100);
bar(b,h./sum(h));
hold on
plot(inversegampdf2(0.1:0.1:10,1,2),'r')