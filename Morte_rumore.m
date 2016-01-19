New_pos=randi(length(Noise_choosen));
New_T=Noise_all(  Noise_choosen(New_pos));
New_q=q-1;
New_Eq=Eq;
New_Eq(:,New_pos)=[];
Compute_RB;
gamma=min(1,1/rb);

z=rand();
if z<gamma
%     display('accettata')
Noise_avaiable=[Noise_avaiable,Noise_choosen(New_pos)];  
Noise_choosen(New_pos)=[];
q=q-1;
bq=New_bq;
Eq=New_Eq;
else
%         display('rifiutata')
     Noise_update;
    SigmaB_update;
end

