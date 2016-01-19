function z=campionaInvGamma(A,B)
z=0;
sigma=1;
for i=1:10000
zhat=z+sigma*randn();
l=rand();
gamma=min(1,normpdf(zhat,z,1)*inversegampdf2(zhat,A,B)/(normpdf(z,zhat,1)*inversegampdf2(z,A,B)));
if inversegampdf2(zhat,A,B)==0
    gamma=0;
end

if l<gamma
    z=zhat;
    sigma=sigma/2;
else
    sigma=sigma*2;
end

end
end