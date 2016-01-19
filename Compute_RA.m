
invC=sigmaEP^(-2)*Pk.'*Pk+sigmaA^(-2)*eye(k);
invCNew=sigmaEP^(-2)*(New_Pk.')*New_Pk+sigmaA^(-2)*eye(New_k);
C=inv(invC);
Cnew=inv(invCNew);
Slack=(ycut-ezp(Eq,bq,ycut));
mu=sigmaEP^(-2)*C*Pk.'*Slack;
muNew=sigmaEP^(-2)*Cnew*New_Pk.'*Slack;
New_ak=muNew;
f1=sigmaA^(-(New_k-k));
f2=sqrt(abs(det(Cnew)/det(C)));
f3=(lambdaA^New_k/factorial(New_k))/(lambdaA^k/factorial(k));
f4=exp(0.5*muNew.'*invCNew*muNew-0.5*mu.'*invC*mu);
ra=f1*f2*f3*f4;
clear invC invCNew Slack mu muNew f1 f2 f3 f4