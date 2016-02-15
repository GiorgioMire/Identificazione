z=rand();

if z<(BN(c,lambdaB,q,length(Noise_all)))
     % display('Nascita Rumore')
    Nascita_rumore
elseif z<(BN(c,lambdaB,q,length(Noise_all))+DN(c,lambdaB,q,length(Noise_all)))
     %display('Morte Rumore')
    Morte_rumore
else 
        % display('Aggiornamento Rumore')
for i=1:repeat
SigmaB_update
Noise_update; 
end
end
clear z