i=0
for x=1:0.1:2
    i=i+1;
y(i)=inversegampdf(1./x,1,1.3);
y2(i)=inversegampdf2(x,1,1.3);
end
figure
plot(1./x,y)
hold on
plot(x,y2,'r')
