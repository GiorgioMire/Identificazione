%__ draw Avai
New_pos=randi(length(Process_avaiable));
New_T=Process_all{Process_avaiable(New_pos)};
New_k=k+1;

compute_Pk_New;

Compute_RA;


gamma=min(1,ra);



%_____________ Accept?
z=rand();

if z<gamma
  % display('accettata')
Process_choosen=[Process_choosen,Process_avaiable(New_pos)];
Process_avaiable(New_pos)=[];
k=New_k;
ak=New_ak;
Pk=New_Pk;
clear  New_k New_ak New_Pk ra 
else
   
 %  display('rifiutata')
       for i=1:repeat
 SigmaA_update
 Process_update;
 end
    
end
