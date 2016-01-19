z=rand();

if z<(BN(c,lambdaB,q,length(Noise_all)))
    Nascita_rumore
elseif z<(BN(c,lambdaB,q,length(Noise_all))+D(c,lambdaB,q,length(Noise_all)))
    Morte_rumore
else 
  Noise_update;
end
clear z