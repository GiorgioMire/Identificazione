%_____ Inizializziamo gli insiemi dei termini
%______Inizializzo i termini di processo
i=0;
for upow=0:polinomialOrderP
    for ypow=0:polinomialOrderP
        for udelay=0:dynamicOrderP
            for ydelay=min(1,dynamicOrderP):dynamicOrderP
                
                condizione1=(upow+ypow>polinomialOrderP);
                condizione2=(upow==0 && ypow==0 && udelay>0 && ydelay>1);
                condizione3=(upow==0 &&  udelay>0 );
                condizione4=(ypow==0 &&  ydelay>1 );
                condizione5=(ydelay==0 && ypow~=0);
                if condizione1 || condizione2 ||condizione3 || condizione4  || condizione5
                    break
                else
                    i=i+1;
                    Process_all(i).type='p';
                    Process_all(i).udelay=udelay;
                    Process_all(i).upow=upow;
                    Process_all(i).ydelay=ydelay;
                    Process_all(i).ypow=ypow;
                    Process_all(i).id=i;
                    Process_avaiable(i)=i;
                    
                end
              
                
                
                
                
                
            end
        end
    end
end
Process_choosen=1;
Process_avaiable(Process_avaiable==1)=[];
Process_avaiable
clear i condizione1 condizione2 condizione3 condizione4 condizione5
%______Inizializzo i termini di rumore
i=0;
for upow=0:polinomialOrderN
    for ypow=0:polinomialOrderN
        for udelay=0:dynamicOrderN
            for ydelay=1:dynamicOrderN
                for epow=1:polinomialOrderN
                    for edelay=1:dynamicOrderN
                        
                        condizione1=(upow+ypow+epow>polinomialOrderN);
                        
                        condizione3=(upow==0 &&  udelay>0 );
                        condizione4=(ypow==0 &&  ydelay>1 );
                        if condizione1  ||condizione3 || condizione4
                            break
                        else
                            i=i+1;
                            Noise_all(i).type='n';
                            Noise_all(i).udelay=udelay;
                            Noise_all(i).upow=upow;
                            Noise_all(i).ydelay=ydelay;
                            Noise_all(i).ypow=ypow;
                            Noise_all(i).epow=epow;
                            Noise_all(i).edelay=edelay;
                            Noise_all(i).id=i;
                            Noise_avaiable(i)=i;
                        end
                        Noise_choosen=[];
                        
                        
                        
                    end
                end
            end
        end
    end
end

clear i