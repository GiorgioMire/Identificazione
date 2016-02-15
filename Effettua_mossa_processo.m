z=rand();

if k==0
    B=1;
elseif k==length(Process_all)
    B=0;
else
num=(lambdaA^(k+1))/factorial(k+1);
den=(lambdaA^(k))/factorial(k);
B=c*min(1,(num/den)^1);
end

if k>0
num=(lambdaA^(k-1))/factorial(k-1);
den=(lambdaA^(k))/factorial(k);
D=c*min(1,(num/den)^1);
end

if z<B
  %display('Nascita Processo')
    Nascita_processo
elseif z<(B+D)
   % display('Morte Processo')
    Morte_processo
else 
   %  display('Aggiornamrento Processo')
    for i=1:repeat
 SigmaA_update
 Process_update;
 end
   
end
clear z