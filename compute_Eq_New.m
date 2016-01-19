aggiunta=[];
T=Noise_all(Noise_avaiable(New_pos));
for t=windowSize+dynamicOrder:-1:dynamicOrder+1;
aggiunta(t,1)=uwork(t-T.udelay)^T.upow*ywork(t-T.ydelay)^T.ypow*ework(t-T.edelay)^T.epow;
end
New_Eq=[Eq,aggiunta(dynamicOrder+1:windowSize+dynamicOrder)];
clear t T aggiunta