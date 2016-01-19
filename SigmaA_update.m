pd=makedist('Gamma','a',alphaA+0.5*k,'b',1/(betaA+0.5*eaz(ak.'*ak,1)));
% pd
 sigmaA=sqrt(1/random(pd));
% figure(100)
% plot(sqrt(pd.pdf(1/1:10)))
% pause(0.001)