%___ Definisco i segnali
ework=zeros(1,windowSize+dynamicOrder);
ecut=zeros(1,windowSize);

t=[1:N]';
u=2*(rand(1,N)-0.5);
e=(sigmaE*randn(1,N)).';
y=(zeros(1,N)).';
eestim=zeros(size(e,1),size(e,2));

ProcessTarget=[ 13 3 31 25];
akTarget=[ -0.5 , 0.6 ,0.7 ,-0.7];
NoiseTarget=[1]
bqTarget=[0.9]
% NoiseTarget=[1 24];
% bqTarget=[ 0.2 , -0.3 ];
 
for t=dynamicOrder+1:N
  
     
    for i=1:length(ProcessTarget)
       
  y(t,1)=y(t,1)+akTarget(i).*Process_all{ProcessTarget(i)}(t,u,y);
    end
    
   if ~isempty(NoiseTarget) 
   for i=1:length(NoiseTarget)
  y(t,1)=y(t,1)+bqTarget(i).*Noise_all{NoiseTarget(i)}(t,u,y,e);

   end
   end
   y(t,1)=y(t,1)+e(t);
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
pause(2)

