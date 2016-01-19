%__ draw Avai
New_pos=randi(length(Noise_avaiable));
New_T=Noise_all(Noise_avaiable(New_pos));
New_q=q+1;

compute_Eq_New;

if q==0
gamma=1;
invCNew=sigmaEN^(-2)*New_Eq.'*New_Eq+sigmaB^(-2)*eye(New_q);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Pk,ak,ycut));


muNew=sigmaEN^(-2)*Cnew*New_Eq.'*Slack;
New_bq=muNew;
else
Compute_RB;
gamma=min(1,rb);
end
%_____________ Accept?
z=rand();
if z<gamma
Noise_choosen=[Noise_choosen,Noise_avaiable(New_pos)];
Noise_avaiable(New_pos)=[];
q=New_q;
bq=New_bq;
Eq=New_Eq;

 clear  New_q New_bq New_Eq rb f1 f2 f3 f4
else
    
  Noise_update;
    SigmaB_update;
end
