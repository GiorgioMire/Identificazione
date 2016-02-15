if New_q==0
    
invC=sigmaEN^(-2)*(Eq.')*Eq+sigmaB^(-2)*eye(q);

C=inv(invC);
Slack=(ycut-ezp(Pk,ak,ycut));

mu=sigmaEN^(-2)*C*Eq.'*Slack;
New_bq=0;

num=sqrt(abs(det(C)))/sigmaA*exp(0.5*mu.'*invC*mu);
den=1;
rb=num/den;
clear invC C Slack mu 

elseif q==0

invCNew=sigmaEN^(-2)*(New_Eq.')*New_Eq+sigmaB^(-2)*eye(New_q);

Cnew=inv(invCNew);
Slack=(ycut-ezp(Pk,ak,ycut));

muNew=sigmaEN^(-2)*Cnew*New_Eq.'*Slack;

New_bq=muNew;

num=sqrt(abs(det(Cnew)))/sigmaA*exp(0.5*muNew.'*invCNew*muNew);
den=1;
rb=num/den;
if isnan(muNew)
    warning('muNew nan')
    rb==0;
end
clear invC C Slack mu 

else

invC=sigmaEN^(-2)*Eq.'*Eq+sigmaB^(-2)*eye(q);
invCNew=sigmaEN^(-2)*(New_Eq.')*New_Eq+sigmaB^(-2)*eye(New_q);
C=inv(invC);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Pk,ak,ycut));
mu=sigmaEN^(-2)*C*Eq.'*Slack;
muNew=sigmaEN^(-2)*Cnew*New_Eq.'*Slack;
New_bq=muNew;
f1=sigmaB^(-(New_q-q));
f2=sqrt(abs(det(Cnew)/det(C)));
f3=(lambdaB^New_q/factorial(New_q))/(lambdaB^q/factorial(q));
f4=exp(0.5*muNew.'*invCNew*muNew-0.5*mu.'*invC*mu);
rb=f1*f2*f3*f4;
clear invC invCNew Slack mu muNew f1 f2 f3 f4
end