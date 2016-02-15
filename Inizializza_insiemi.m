%_____ Inizializziamo gli insiemi dei termini
%______Inizializzo i termini di processo
i=0;
file=fopen('Lista_termini.txt','w')
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
s=sprintf('@(t,u,y)u(t-%i)^%i*y(t-%i)^%i',udelay,upow,ydelay,ypow);
eval(['Process_all{i}=',s,';']);
name=func2str(Process_all{i});
fprintf(file,'%i => %s\n',i,name(9:end))
   Process_avaiable(i)=i;              
               end
              
                
                
                
                
                
            end
        end
    end
end
Process_choosen=[];
% Process_avaiable
 clear i condizione1 condizione2 condizione3 condizione4 condizione5
% %______Inizializzo i termini di rumore
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
                         s=sprintf('@(t,u,y,e)u(t-%i)^%i*y(t-%i)^%i*e(t-%i)^%i',udelay,upow,ydelay,ypow,edelay,epow);
eval(['Noise_all{i}=',s,';']);
   Noise_avaiable(i)=i;    
   name=func2str(Noise_all{i});
fprintf(file,'%i => %s\n',i,name(11:end))
                         
                        end
                        Noise_choosen=[];
                        
                        
                        
                    end
                end
            end
        end
    end
end
fclose(file)
edit Lista_termini.txt
clear i


Process_avaiable=1:length(Process_all);
Process_choosen=[];

     
Noise_avaiable=1:length(Noise_all);
Noise_choosen=[];
