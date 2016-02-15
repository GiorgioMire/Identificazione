
bestak=[];
bestbq=[];

Ebest=[];
Pbest=[];
bestmodelP=mode(modelserie_process);
bestmodelN=mode(modelserie_noise);
[ bestprocess] = ord2Model_separate( bestmodelP,Process_all);
[ bestnoise] = ord2Model_separate( bestmodelN,Noise_all);

for j=1:length(bestprocess)
    T=Process_all{bestprocess(j)};
    bestak_ts=Ak{ord2LowerProcess(bestmodelP)};
    bestak(j,1)=maxhistplot(bestak_ts(j,1:end));
    titolo=sprintf('ak_%i',j);
    title(titolo);
    t=cutInterval;
    for i=1:windowSize
    Pbest(i,j)=T(t(i),u,y);
    end

end
 



for j=1:length(bestnoise)
    T=Noise_all{bestnoise(j)};
    bestbq_ts=Bq{ord2LowerNoise(bestmodelN)};
    bestbq(j,1)=maxhistplot(bestbq_ts(j,1:end));
      titolo=sprintf('bq_%i',j);
    title(titolo);
     t=cutInterval;
       for i=1:windowSize
    Ebest(i,j)=T(t(i),u,y,e);
       end
end

besty=ezp(Pbest,bestak,ycut)+ezp(Ebest,bestbq,ycut);
figure(159)
plot(besty+ecut,'b');
hold on
plot(ycut,'r');
pause(0.00001)
hold off;
figure(160)
plot(ycut-besty-ecut)
pause(0.001)

ProcessTarget
try
    display(bestprocess);
catch
end

NoiseTarget
try
    display(bestnoise);
catch
end

akTarget
try
    display(bestak);
catch
end
bqTarget
try
    display(bestbq);
catch
end

for j=1:length(ProcessTarget)
    T=Process_all{ProcessTarget(j)};
  
    t=cutInterval;
    for i=1:windowSize
    PTarget(i,j)=T(t(i),u,y);
    end

end
normbesteps=[normbesteps,norm(besty-ycut)];
normecut=[normecut,norm(ecut)];
figure(500)
plot(normbesteps,'b')
hold on
plot(normecut,'r')
hold off


sum(ecut-e(cutInterval))