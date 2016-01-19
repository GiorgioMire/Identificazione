function [ Y ] = inversegampdf( X,A,B )
p=makedist('Gamma','a',A,'b',1/B);
Y=(p.pdf(X));


end