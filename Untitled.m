for l=1:length(modelserie)
    vect(l)=mode(modelserie(1:l));
end
plot(vect)