aggiunta=[];
T=Process_all{Process_avaiable(New_pos)};
t=cutInterval;
for i=1:length(t);
aggiunta(i,1)=T(t(i),u,y);
end
New_Pk=[Pk,aggiunta];
clear t T aggiunta