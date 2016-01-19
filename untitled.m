x = 0.01:0.01:7;
invgam = @(x,a,b) b^a/gamma(a).*(1./x).^(a+1).*exp(-b./x);
plot(x, invgam(x,2,2));

