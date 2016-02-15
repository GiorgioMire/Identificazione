theta=1/(betaA+0.5*eaz(ak.'*ak,1));
pd=makedist('Gamma','a',alphaA+0.5*k,'b',1/theta);
 sigmaA=sqrt(1/random(pd));
