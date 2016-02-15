
E=[];
t=cutInterval;
if q~=0
for j=1:length(Noise_choosen)
    for i=1:windowSize
        T=Noise_all{Noise_choosen(j)};
         E(i,j)=T(t(i),u,y,e);
    end
end
end
Eq=E;
clear E t;
    