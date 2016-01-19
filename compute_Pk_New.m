aggiunta=[];
T=Process_all(Process_avaiable(New_pos));
for t=dynamicOrder+1:+1:length(workInterval);
aggiunta(t,1)=uwork(t-T.udelay)^T.upow*ywork(t-T.ydelay)^T.ypow;
end
New_Pk=[Pk,aggiunta(dynamicOrder+1:length(workInterval))];
clear t T aggiunta