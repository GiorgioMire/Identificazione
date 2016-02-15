
residual=ycut-ezp(Pk,ak,ycut)-ezp(Eq,bq,ycut);
% figure(5)
% plot(residual)
% pause(0.01)
eestim(cutInterval)=residual;
eestim(abs(eestim)>100)=100;
