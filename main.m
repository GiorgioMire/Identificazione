%_ Pulizia del workspace
close all
clear all
clc

burnin=2;
lambdaA=3;
lambdaB=0;
betaLA=1.1;
betaLB=1.1;
alphaLA=0.5;
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
dynamicOrderP=2;
polinomialOrderP=1;
dynamicOrderN=1;
polinomialOrderN=1;
dynamicOrder=max(dynamicOrderP,dynamicOrderN);
sigmaA=10;
sigmaB=10;

nIterations=100000;
N=60000;
Inizializza_insiemi
Crea_segnali
plot_k=[];

Mode=[];

%__ Qui inizia il ciclo di identificazione
for it=1:nIterations
  fprintf('Iterazione %i\n',it);

%__Shift dei segnali e delle matrici di una unità di tempo
Shift_segnali_e_matrici    
 Effettua_mossa_processo
 simulateLa;
 
 for i=1:4
 SigmaA_update
 Process_update;
 end
 
% 
% if it>2
% Effettua_mossa_rumore
% simulateLb;
% Noise_update;
% end
calculateResidual;
figure(400)
plot(residual)
% for i=1:2
% SigmaB_update
% Noise_update; 
% end
 ak(1)=akTarget;
 updateEq;

%Pruning;
%  current_model
     if it>=burnin
     coding;
     if mode(modelserie)~=0
     Mode=[Mode,mode(modelserie)];
     end
     
     
     risultationline
     end
    

end
     