bestprocessid=mode(modelserie_process(modelserie_process~=0));
bestprocess=ord2Model_separate(bestprocessid,Process_all);
bestaks=Ak{LowerP(bestprocessid)};
bestak=[];

for i=1:size(bestaks,1)
    string=func2str(Process_all{bestprocess(i)});
    string=string(9:end);
bestak(i)=maxhistplot(bestaks(i,:));
title(['p(a_',num2str(i),'|y), del termine  ',string])
end

[bestprocess,s]=sort(bestprocess);
bestak=bestak(s);
[ProcessTarget,s]=sort(ProcessTarget);
akTarget=akTarget(s);

bestak
akTarget
bestprocess
ProcessTarget

bestnoiseid=mode(modelserie_noise);
bestnoise=ord2Model_separate(bestnoiseid,Noise_all);
bestbqs=Bq{LowerN(bestnoiseid)};
bestbq=[];

for i=1:size(bestbqs,1)
    string=func2str(Noise_all{bestnoise(i)});
    string=string(11:end);
bestbq(i)=maxhistplot(bestbqs(i,:));
title(['p(b_',num2str(i),'|y) del termine  ',string])
end

[bestNoise,s]=sort(bestnoise);
bestbq=bestbq(s);
[NoiseTarget,s]=sort(NoiseTarget);
bqTarget=bqTarget(s);

bestbq
bqTarget
bestnoise
NoiseTarget
