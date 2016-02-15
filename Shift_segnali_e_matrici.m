t_base=dynamicOrder+it;
t_end=t_base+windowSize-1;
cutInterval=t_base:t_end;
workInterval=it:t_end;
ycut=y(cutInterval);
ucut=u(cutInterval);
ework=e(workInterval);
ywork=y(workInterval);
uwork=u(workInterval);
ecut=e(cutInterval);
%_______________________________________
% Shift della matrice Pk
if ~isempty(Pk)
Pk(1,:)=[];
end
aggiunta=[];

for i=1:length(Process_choosen)
    
    pos=Process_choosen(i);
    T=Process_all{pos};
    aggiunta(1,i)=T(t_end,u,y);
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
    T=Noise_all{pos};
    aggiunta(1,i)=T(t_end,u,y,e);
end
Eq=[Eq;aggiunta];

clear aggiunta pos i base T ;
