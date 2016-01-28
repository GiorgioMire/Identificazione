%__ draw Avai
New_pos=randi(length(Process_avaiable));
New_T=Process_all{Process_avaiable(New_pos)};
New_k=k+1;

compute_Pk_New;

if k==0
gamma=1;
invCNew=sigmaEP^(-2)*New_Pk.'*New_Pk+sigmaA^(-2)*eye(New_k);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Eq,bq,ycut));
muNew=sigmaEP^(-2)*Cnew*New_Pk.'*Slack;
New_ak=muNew;
clear muNew Slack Cnew invCNew 
else
Compute_RA;
gamma=min(1,ra);

% if it==2
%     plot_gamma=[];
% end
% plot_gamma=[plot_gamma,gamma];
% figure(2)
% plot(plot_gamma)
% pause(0.1)
end
%_____________ Accept?
z=rand();

if z<gamma
%     display('accettata')
Process_choosen=[Process_choosen,Process_avaiable(New_pos)];
Process_avaiable(New_pos)=[];
k=New_k;
ak=New_ak;
Pk=New_Pk;
% if norm(ak)>80
%     error('e')
% end

 clear  New_k New_ak New_Pk ra 
else
%     display('rifiutata')
      Process_update;
    SigmaA_update;
    
end
