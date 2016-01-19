
invC=sigmaEN^(-2)*Eq.'*Eq+sigmaB^(-2)*eye(q);
invCNew=sigmaEN^(-2)*(New_Eq.')*New_Eq+sigmaB^(-2)*eye(New_q);
C=inv(invC);
Cnew=inv(invCNew);
if isempty(Eq)
   Slack=ycut;
else
Slack=(ycut-ezp(Pk,ak,ycut));
end
mu=sigmaEN^(-2)*C*Eq.'*Slack;
muNew=sigmaEN^(-2)*Cnew*New_Eq.'*Slack;
% if norm(muNew)>80
%     error('e')
% end
New_bq=muNew;

f1=sigmaB^(-(New_q-q));
f2=sqrt(abs(det(Cnew)/det(C)));
f3=(lambdaB^New_q/factorial(New_q))/(lambdaB^q/factorial(q));
f4=exp(0.5*muNew.'*invCNew*muNew-0.5*mu.'*invC*mu);
rb=f1*f2*f3*f4;
clear f1 f2 f3 C Cnew Slack