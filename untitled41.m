figure
x=0:0.1:length(Process_all)+1
for kk=0:length(Process_all)
    alphaLA=0.5;
    betaLa=1.1;
    pd=makedist('Gamma','a',alphaLA+kk,'b',1/betaLa)
    plot(x,pd.pdf(x))
    hold on
end
hold off