%___ Definisco i segnali
ework=zeros(1,windowSize+dynamicOrder);
ecut=zeros(1,windowSize);

u=0.5*(2*rand(1,N)-1);%+0.5*ones(1,N)+0.5*sin(data.u.times).';
e=(sigmaE*randn(1,N)).';
y=(sigmaE*randn(1,N)).';

for t=dynamicOrder+1:N
  y(t,1)=0.75*u(t-1)+0.4*e(t-1)+e(t);
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

