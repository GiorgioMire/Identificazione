
bestak=[];
bestbq=[];
Ebest=[];
Pbest=[];
bestmodel=mode(modelserie(modelserie~=0));
[ bestprocess,bestnoise] = ord2Model( bestmodel,Process_all,Noise_all);
for j=1:length(bestprocess)
    T=Process_all{bestprocess(j)};
    bestak_ts=Ak{ord2Lower(bestmodel)};
    bestak(j,1)=maxhist(bestak_ts(j,1:end));
    
    t=cutInterval;
    for i=1:windowSize
    Pbest(i,j)=T(t(i),u,y);
    end

end
 



for j=1:length(bestnoise)
    T=Noise_all{bestnoise(j)};
    bestbq_ts=Bq{ord2Lower(bestmodel)};
    bestbq(j)=maxhist(bestbq_ts(j,1:end));
   
       for i=1:windowSize
    Ebest(i,j)=T(t(i),u,y,e);
       end
end
bestak(1)=akTarget(1);
besty=ezp(Pbest,bestak,ycut)+ezp(Ebest,bestbq,ycut);
figure(159)
plot(besty+ecut,'b');
hold on
plot(ycut,'r');
pause(0.00001)
hold off;
figure(160)
plot(ycut-besty)

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