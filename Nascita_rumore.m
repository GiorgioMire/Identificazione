%__ draw Avai
New_pos=randi(length(Noise_avaiable));
New_T=Noise_all(Noise_avaiable(New_pos));
New_q=q+1;

compute_Eq_New;

Compute_RB;


gamma=min(1,rb);

%_____________ Accept?
z=rand();
if z<gamma
   % display('ACCETTATA')
Noise_choosen=[Noise_choosen,Noise_avaiable(New_pos)];
Noise_avaiable(New_pos)=[];
q=New_q;
bq=New_bq;
Eq=New_Eq;
if q==0
    bq=0;
end
if q-1~=0
  for i=1:repeat
 SigmaB_update
Noise_update;
  end
end

 clear  New_q New_bq New_Eq rb f1 f2 f3 f4
else
    %display('RIFIUTATA!')
 
for i=1:repeat

SigmaB_update
Noise_update; 
end
end
