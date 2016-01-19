pd=makedist('Gamma','a',alphaB+0.5*q,'b',1/(betaB+0.5*bq.'*bq));
sigmaB=sqrt(1/random(pd));
% xinv=1/5:0.1:10;
% figure(2000)
% plot(1./xinv,pd.pdf(xinv));
% pause(0.001)