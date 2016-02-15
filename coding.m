
[Process_choosen_c,idx]=sort(Process_choosen);
  [Noise_choosen_c,idx2]=sort(Noise_choosen);
  
if it==burnin
        LowerP=containers.Map(0,0);
    LowerP.remove(0);
     LowerN=containers.Map(0,0);
    LowerN.remove(0);
    ord2LowerNoise=containers.Map(0,0);
    ord2LowerNoise.remove(0);
    modelserie_process=[];
       modelserie_noise=[];
  Ak{1}=[];
  Bq{1}=[];
end
  
id_process=Model2ord_separate( Process_choosen_c,Process_all);
[checkProcess]=ord2Model_separate(id_process,Process_all);
id_noise=Model2ord_separate( Noise_choosen_c,Noise_all);
[checkNoise]=ord2Model_separate(id_noise,Noise_all);

if ~isequal(Noise_choosen,checkNoise)
    if ~isempty(Noise_choosen) && ~isempty(checkNoise)
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

%Bq{id_noise+1}=[Bq{id_noise+1},bq(idx2)];


%  if ~(ord2LowerProcess.isKey(id_process))
%      lower=ord2LowerProcess.Count+1;
%      ord2LowerProcess(id_process)=lower;
%      Lower2ordProcess(lower)=id_process;
%  end
%   if ~(ord2LowerNoise.isKey(id_noise))
%      lower=ord2LowerNoise.Count+1;
%      ord2LowerNoise(id_noise)=lower;
%      Lower2ordNoise(lower)=id_noise;
%  end
%  
% if length(Ak)<ord2LowerProcess(id_process)
%  Ak{ord2LowerProcess(id_process)}=[];
% end
% if length(Bq)<ord2LowerNoise(id_noise)
%     Bq{ord2LowerNoise(id_noise)}=[];
% end
% Ak{ord2LowerProcess(id_process)}=[Ak{ord2LowerProcess(id_process)},ak(idx),];
% Bq{ord2LowerNoise(id_noise)}=[Bq{ord2LowerNoise(id_noise)},bq(idx2)];
% 
% if ~isempty(idx)
% ak=ak(idx);
% end
% 
% if ~isempty(idx2)
% bq=bq(idx2);
%  
% end
% 
%    

