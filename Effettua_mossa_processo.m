z=rand();

if z<B(c,lambdaA,k,length(Process_all))
%     display('Nascita')
    Nascita_processo
elseif z<(B(c,lambdaA,k,length(Process_all))+D(c,lambdaA,k,length(Process_all)))
%     display('Morte')
    Morte_processo
else 
   Process_update;
end
clear z