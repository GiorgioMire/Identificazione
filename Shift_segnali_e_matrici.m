base=dynamicOrder+it;
cutInterval=base:base+windowSize-1;
workInterval=it:base+windowSize-1;
ycut=y(cutInterval);
ucut=u(cutInterval);
ework=e(workInterval);
ywork=y(workInterval);
uwork=u(workInterval);
ecut=e(cutInterval);
% INTERVALLI TESTATI, VANNO BENE

%_______________________________________
% Shift della matrice Pk
if ~isempty(Pk)
Pk(1,:)=[];
end
aggiunta=[];
%   t=length(workInterval);
for i=1:length(Process_choosen)
    pos=Process_choosen(i);
    T=Process_all(pos);
  
    aggiunta(1,i)=uwork(end-T.udelay)^T.upow*ywork(end-T.ydelay)^T.ypow;

end
Pk=[Pk;aggiunta];

%_______________________________________
% Shift della matrice Eq
if ~isempty(Eq)
Eq(1,:)=[];
end
aggiunta=[];
  
for i=1:length(Noise_choosen)
    pos=Noise_choosen(i);
    T=Noise_all(pos);
    aggiunta(1,i)=uwork(end-T.udelay)^T.upow*ywork(end-T.ydelay)^T.ypow*ework(end-T.edelay)^T.epow;
end
Eq=[Eq;aggiunta];

clear aggiunta pos i base T ;
