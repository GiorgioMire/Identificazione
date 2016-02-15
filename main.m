%_ Pulizia del workspace
close all
clear all
clc

repeat=1;
burnin=1;
m0=0.5;
v0=0.5;
beta=m0/v0;
alphaLA=0.5;m0*beta;
alphaLB=0.5;m0*beta;
betaLA=1.1;beta;
betaLB=1.1;beta;

betaA=0;
betaB=1.1;
alphaA=2;
alphaB=2;
SNRU=20;


sigmaE=sqrt(0.01);
sigmaEP=sqrt(0.05);
sigmaEN=sqrt(0.01);
proposal_factor=1;
windowSize=1000;
k=0;
q=0;
Pk=[];
Eq=[];
ak=0;
bq=0;
lambdaA=2;
lambdaB=2;
c=0.7;
dynamicOrderP=2;
polinomialOrderP=3;
dynamicOrderN=1;
polinomialOrderN=1;%3;
dynamicOrder=max(dynamicOrderP,dynamicOrderN);
sigmaA=5;
sigmaB=5;

nIterations=100000;
N=60000;
Inizializza_insiemi
Crea_segnali

SNRu=20*log10(var(u)/sigmaE^2);
SNRu=20*log10(1/3/sigmaE^2);
SNRy=20*log10(var(y)/sigmaE^2);


figure
x=0:0.1:length(Process_all)+1
for kk=0:length(Process_all)
    pd=makedist('Gamma','a',alphaLA+kk,'b',1/betaLA);
    plot(x,pd.pdf(x))
    hold on
end
hold off
input('press a key to continue')

Prepare_series
%__ Qui inizia il ciclo di identificazione
for it=1:nIterations
    if mod(it,1)==0
  fprintf('Iterazione %i\n',it);
    end
   

%__Shift dei segnali e delle matrici di una unità di tempo
Shift_segnali_e_matrici 

 Effettua_mossa_processo
 simulateLa;
if it>2
   
Effettua_mossa_rumore
simulateLb;
end

calculateResidual;
 updateEq;
     if it>=burnin
     coding;
    
     
 
     end

save_series;
end
     