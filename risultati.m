


bestmodel_P=mode(modelserie_process);
[ bestprocess] = ord2Model_separate( bestmodel,Process_all);
% if it<burnin+100
file= fopen('Risultati.txt','w');
% end
fprintf(file,'\n___________________________ \n');
fprintf(file,'\n ITERAZIONE %i \n',it);

fwrite(file,bestprocess);
for j=1:length(bestprocess)
    T=Process_all{bestprocess(j)};
    bestak=Ak{ord2Lower(bestmodel)};
    coeff=maxhist(bestak(j,ceil(1/10*size(bestak,2)):end));

end
  

for j=1:length(bestnoise)
    T=Noise_all(bestnoise(j));
    bestbq=Bq{ord2Lower(bestmodel)};
    coeff2=maxhist(bestbq(j,ceil(1/10*size(bestbq,2)):end));
 
end
fclose(file);
figure
plot(Mode)
edit Risultati.txt