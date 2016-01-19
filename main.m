%_ Pulizia del workspace
close all
clear all
clc
%_ Creo le mappe che permettono di contare i modelli
Mode=[];
burnin=2;
%_ Inizializzo i parametri e gli iperparametri
betaLA=1.1;
betaLB=1.1;
alphaLA=0.5;%0.5;
alphaLB=0.5;
betaA=1.1;
betaB=1.1;
alphaA=2;
alphaB=2;
akh=[];
plot_k=[];
sigmaEP=0.5*sqrt(0.02);
sigmaEN=0.05*sqrt(0.02);
sigmaE=0.05*sqrt(0.02);
windowSize=100;
k=1;
q=0;
Pk=ones(windowSize,1);
Eq=[];
ak=1;
bq=0;
lambdaA=3;
lambdaB=0;
c=0.6;
dynamicOrderP=1;
polinomialOrderP=1;
dynamicOrderN=1;
polinomialOrderN=1;
dynamicOrder=max(dynamicOrderP,dynamicOrderN);
sigmaA=10;
sigmaB=10;

nIterations=100000;
N=2000000;
Inizializza_insiemi
Crea_segnali
plot_k=[];
%__ Qui inizia il ciclo di identificazione
for it=1:nIterations
  fprintf('Iterazione %i\n',it);

%__Shift dei segnali e delle matrici di una unit� di tempo
Shift_segnali_e_matrici    
 Effettua_mossa_processo
 simulateLa;
 for i=1:2
 SigmaA_update
 Process_update;
 
 end
% 
if it>2
Effettua_mossa_rumore
simulateLb;
Noise_update;
end
calculateResidual;
% % figure(400)
% % plot(residual)
for i=1:2
SigmaB_update
Noise_update; 
end
 updateEq;
Pruning;
%  current_model
     if it>=burnin
     coding;
     if mode(modelserie)~=0
     Mode=[Mode,mode(modelserie)];
     end
     end
%   figure(100)
%      plot(Mode)
% 
%      pause(0.01);
%      end
%      
% salvataggi
% if( it>100)
%  figure(3000)
%   plot_k=[plot_k,lambdaA];
% %   
%    if ~isempty(plot_k)
%           [h,b]=hist(plot_k,0:max(plot_k));
%           bar(b,h./sum(h))
%           ylim([0,1])
%  pause(0.001)
%    end
% end

% pause(0.1)  
% figure(2)
%   if ~exist('plot_lambdaA')
%     plot_lambdaA=[];
% end
% plot_lambdaA=[plot_lambdaA,lambdaB];
% figure(2)
% plot(plot_lambdaA)
% pause(0.1)  
if numel(bq)~=0
akh=[akh,bq(1)];
end
figure(100)
plot(akh)
pause(0.0000001)


end
     