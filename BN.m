function [ p] = BN(c,lambda,n,nmax )
if n<=0 
    p=1;
elseif n==nmax
    p=0;
else
num=(lambda^(n+1))/factorial(n+1);
den=(lambda^(n))/factorial(n);
p=c*min(1,num/den);
end
end

