
[Process_choosen_c,idx]=sort(Process_choosen);
  [Noise_choosen_c,idx2]=sort(Noise_choosen);
  
if it==burnin
        LowerP=containers.Map(0,0);
    LowerP.remove(0);
     LowerN=containers.Map(0,0);
    LowerN.remove(0);
        modelserie_process=[];
       modelserie_noise=[];
  Ak{1}=[];
  Bq{1}=[];
end
  
id_process=Model2ord_separate( Process_choosen_c,Process_all);
[checkProcess]=ord2Model_separate(id_process,Process_all);
id_noise=Model2ord_separate( Noise_choosen_c,Noise_all);
[checkNoise]=ord2Model_separate(id_noise,Noise_all);

if ~isequal(Noise_choosen_c,checkNoise)
    if ~isempty(Noise_choosen_c) && ~isempty(checkNoise)
    error('coding failed')
    end
end
if ~isequal(Process_choosen_c,checkProcess)
    if ~isempty(Process_choosen_c) && ~isequal(checkProcess)
    error('coding failed')
    end
end
% if k~=0
modelserie_process=[modelserie_process,id_process];
modelserie_noise=[modelserie_noise,id_noise];
if ~LowerP.isKey(id_process)
    n=LowerP.Count+1;
 LowerP(id_process)=n;
 UpperP(n)=id_process;
 Ak{n}=[];
end
Ak{LowerP(id_process)}=[Ak{LowerP(id_process)},ak(idx)];
 ModeProcess=[ModeProcess,LowerP(mode(modelserie_process))];
 
 if ~LowerN.isKey(id_noise)
    n=LowerN.Count+1;
 LowerN(id_noise)=n;
 UpperN(n)=id_noise;
 Bq{n}=[];
end
Bq{LowerN(id_noise)}=[Bq{LowerN(id_noise)},bq(idx2)];
 ModeNoise=[ModeNoise,LowerN(mode(modelserie_noise))];


