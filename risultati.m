fid = fopen('Crea_segnali.m');
tline = fgetl(fid);
for i=1:9
    tline = fgetl(fid);
    
end

fclose(fid);



bestmodel=mode(modelserie(modelserie~=0));
[ bestprocess,bestnoise] = ord2Model( bestmodel,Process_all,Noise_all);
% if it<burnin+100
file= fopen('Risultati.txt','w');
% end
fprintf(file,'\n___________________________ \n');
fprintf(file,'\n ITERAZIONE %i \n',it);
fprintf(file,'\nEQUAZIONE TARGET\n');
fprintf(file,tline);
fprintf(file,'\nMODELLO DI PROCESSO\n');
formatSpec = '\n %i termine= %5.3f * u(t-%i)^%i * y(t-%i)^%i\n';
fwrite(file,bestprocess);
for j=1:length(bestprocess)
    T=Process_all(bestprocess(j));
    bestak=Ak{ord2Lower(bestmodel)};
    coeff=maxhist(bestak(j,ceil(1/10*size(bestak,2)):end));
   fprintf(file,formatSpec,j,coeff,T.udelay,T.upow,T.ydelay,T.ypow);
end
  fprintf(file,'\nMODELLO DI RUMORE\n');
formatSpec = '\n %i termine= %5.3f * u(t-%i)^%i * y(t-%i)^%i* e(t-%i)^%i\n';

for j=1:length(bestnoise)
    T=Noise_all(bestnoise(j));
    bestbq=Bq{ord2Lower(bestmodel)};
    coeff2=maxhist(bestbq(j,ceil(1/10*size(bestbq,2)):end));
   fprintf(file,formatSpec,j,coeff2,T.udelay,T.upow,T.ydelay,T.ypow,T.edelay,T.epow);
end
fclose(file);
% bestmod=[];
% for i=1:length(modelserie)
%     bestmod=[bestmod,mode(modelserie(1:i))];
% end
% figure
% plot(bestmod)
figure
plot(Mode)
edit Risultati.txt