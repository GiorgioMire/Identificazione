% ework(dynamicOrder+1:end)=residual;
% ecut=residual;
E=[];
t=dynamicOrder+1:dynamicOrder+windowSize;
if q~=0
for j=1:length(Noise_choosen)
    for i=1:windowSize
        T=Noise_all(Noise_choosen(j));
         E(i,j)=(uwork(t(i)-T.udelay)^T.upow)*(ywork(t(i)-T.ydelay)^T.ypow)*(ework(t(i)-T.edelay)^T.epow);
    end
end
end
Eq=E;
clear E t;
    