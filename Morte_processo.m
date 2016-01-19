New_pos=randi(length(Process_choosen));
New_T=Process_all(  Process_choosen(New_pos));
New_k=k-1;
New_Pk=Pk;
New_Pk(:,New_pos)=[];
Compute_RA;
gamma=min(1,1/ra);

% if ~exist('plot_gamma')
%     plot_gamma=[];
% end
% plot_gamma=[plot_gamma,gamma];
% figure(2)
% plot(plot_gamma)
% pause(0.1)

z=rand();

if z<gamma
%     display('accettata')
Process_avaiable=[Process_avaiable,Process_choosen(New_pos)];  
Process_choosen(New_pos)=[];
k=New_k;
ak=New_ak;
Pk=New_Pk;
clear New_k New_ak New_Pk
else
%     display('rifiutata')
    Process_update;
    SigmaA_update;
end

