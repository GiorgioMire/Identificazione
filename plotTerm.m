function plotTerm(T)
if T.type=='p'
formatSpec = '\n %i° termine=  u(t-%i)^%i * y(t-%i)^%i\n';
fprintf(formatSpec,T.id,T.udelay,T.upow,T.ydelay,T.ypow);
else
formatSpec = '\n %i° termine=  u(t-%i)^%i * y(t-%i)^%i* e(t-%i)^%i\n';
fprintf(formatSpec,T.id,T.udelay,T.upow,T.ydelay,T.ypow,T.edelay,T.epow);
end