  [Process_choosen,idx]=sort(Process_choosen);
  [Noise_choosen,idx2]=sort(Noise_choosen);
if it==burnin
    ord2Lower=containers.Map(0,0);
    ord2Lower.remove(0);
    modelserie=[];
  Ak{1}=[];
  Bq{1}=[];
  end
id=Model2ord( Process_choosen,Noise_choosen,Process_all,Noise_all);
% if k~=0
modelserie=[modelserie,id];
 
 if ~(ord2Lower.isKey(id))
     ord2Lower(id)=ord2Lower.Count+1;
     Lower2ord(ord2Lower.Count+1)=id;
 end
 
if length(Ak)<ord2Lower(id)
 Ak{ord2Lower(id)}=[];
end
if length(Bq)<ord2Lower(id)
    Bq{ord2Lower(id)}=[];
end
Ak{ord2Lower(id)}=[Ak{ord2Lower(id)},ak(idx),];
Bq{ord2Lower(id)}=[Bq{ord2Lower(id)},bq(idx2)];
ak=ak(idx);
bq=bq(idx2);
% end

