%_ Pulizia del workspace
close all
clear all
clc

% Numero di volte con cui si ripete l'algoritmo di aggiornamento

repeat=1;

% Numero di iterazioni da saltare prima di costruire le statistiche

burnin=1;

% Valore atteso dell'parametro lambda quando il modello è vuoto

m0=0.1;

% Varianza dell'parametro lambda

v0=1;
beta=m0/v0;

% Iperparametri di lambda (valore atteso del numero di termini)

alphaLA=0.5;m0*beta;
alphaLB=0.5;m0*beta;
betaLA=1.1;beta;
betaLB=1.1;beta;

% Iperparametri di sigma (Varianza del vettore di coefficienti)

betaA=0;
betaB=1.1;
alphaA=2;
alphaB=2;

% Deviazione standard del rumore bianco

sigmaE=sqrt(0.01);

% Grado di libertà per tuning della frequenza di accettazione delle mosse
% (deviazione standard ipotizzata del rumore) 

sigmaEP=sqrt(0.05);
sigmaEN=sqrt(0.01);

% Grado di libertà per modificare la varianza della proposal nella mossa di
% aggiornamento

proposal_factor=1;

% Dimensione della finestra temporale di identificazione

windowSize=500;

% Inizializzazione del numero di termini (modello iniziale vuoto)

k=0;
q=0;

% Inizializzazione delle matrici di regressione

Pk=[];
Eq=[];

% Inizializzazione dei vettori di coefficienti

ak=0;
bq=0;

% Inizializzazione dei valori attesi del numero di coefficienti

lambdaA=2;
lambdaB=2;

% Inizializzazione delle varianze delle proposal dei coefficienti

sigmaA=5;
sigmaB=5;

% Rapporto di frequenza tra le mosse dinamiche (morte e nascita) e quella
% di aggiornamento

c=0.3;

% Massimo ritardo che compare nei termini disponibili 

dynamicOrderP=2; % Nel modello di processo
dynamicOrderN=2; % Nel modello di rumore
dynamicOrder=max(dynamicOrderP,dynamicOrderN);  % complessivamente

% Massimo grado polinomiale possibile 

polinomialOrderP=3;
polinomialOrderN=3;

% Numero di iterazioni

nIterations=30000;

% Numero di campioni di segnale da generare
N=60000;

%
Inizializza_insiemi
Crea_segnali

% Check sui rapporti segnale/rumore
SNRu=20*log10(var(u)/sigmaE^2);
SNRu=20*log10(1/3/sigmaE^2);
SNRy=20*log10(var(y)/sigmaE^2);


% figure
% x=0:0.1:length(Process_all)+1
% for kk=0:length(Process_all)
%     pd=makedist('Gamma','a',alphaLA+kk,'b',1/betaLA);
%    
%     plot(x,pd.pdf(x))
%     hold on
% end
% hold off
% input('press a key to continue')

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
% updateEq;
     if it>=burnin
     coding;
    
     
 
     end

save_series;

end
     