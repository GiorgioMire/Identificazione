theta=1/(betaLA);
pd=makedist('Gamma','a',alphaLA+k,'b',theta);
lambdaA=random(pd);
while lambdaA>length(Process_all)
lambdaA=random(pd);
end



