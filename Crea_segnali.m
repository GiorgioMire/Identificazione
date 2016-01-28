%___ Definisco i segnali
ework=zeros(1,windowSize+dynamicOrder);
ecut=zeros(1,windowSize);

u=0.5*(2*rand(1,N)-1);%+0.5*ones(1,N)+0.5*sin(data.u.times).';
e=(sigmaE*randn(1,N)).';
y=(zeros(1,N)).';

ProcessTarget=[1];
akTarget=[0.3];
NoiseTarget=[];
bqTarget=[];


for t=dynamicOrder+1:N
  
     
    for i=1:length(ProcessTarget)
       
  y(t,1)=y(t,1)+akTarget(i).*Process_all{ProcessTarget(i)}(t,u,y);
    end
   if ~isempty(NoiseTarget) 
   for i=1:length(NoiseTarget)
  y(t,1)=y(t,1)+bqTarget(i).*Noise_all{NoiseTarget(i)}(t,u,y,e);
   end
   end
end
clear N
%_________
% Plot dei segnali
PlotDataFigure=figure();
subplot(3,1,1)
plot(u);
title('u')
subplot(3,1,2)
plot(y);
title('y')
subplot(3,1,3)
plot(e);
title('e')

