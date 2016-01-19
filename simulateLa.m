pd=makedist('Gamma','a',alphaLA+k,'b',betaLA);
lambdaA=random(pd);
% if it==1
%     PlotGammaA=figure();
% end
figure(100)
% plot(1/factorial(k)*pd.pdf(0:0.1:1));
% axis([0 10 0 4])
% pause(0.01)
% input('press a key')