
    dabuttare=[];
for l=1:k
    if(abs(ak(l))<0.05)
  dabuttare=[dabuttare,l]; 
    end
end
 if ~isempty(dabuttare)
    dabuttare=dabuttare(1);
    end
if length(Process_choosen)==length(dabuttare) && ~isempty(dabuttare)
    dabuttare(randi(dabuttare))=[];
end
Process_avaiable=[Process_avaiable,Process_choosen(dabuttare)];
Process_choosen(dabuttare)=[];

ak(dabuttare)=[];

        Pk(:,dabuttare)=[];
        k=length(Process_choosen);
    dabuttare=[];
    for l=1:q
        if(abs(bq(l))<0.05)
       
             dabuttare=[dabuttare,l];
        end
    end
    if ~isempty(dabuttare)
    dabuttare=dabuttare(1);
    end
    Noise_avaiable=[Noise_avaiable, Noise_choosen(dabuttare)];
  Noise_choosen(dabuttare)=[];

bq(dabuttare)=[];
        Eq(:,dabuttare)=[];
        q=length(Noise_choosen);
