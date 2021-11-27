
function [t_env,env] = envelope(a,d,s,sd,r,fs)
 
 tattack = 0:1/fs:a;
 env = 0:1/(a*fs):1;
 t_env = tattack;
 
 tdecay = a+1/fs:1/fs:a+d;
 env = [env,1+(s-1)/(fs*d):(s-1)/(fs*d):s];
 t_env = [t_env,tdecay];
 
 tsustain = a+d+1/fs:1/fs:a+d+sd;
 env = [env,s+zeros(1,sd*fs)];
 t_env = [t_env,tsustain];
 
 trelease = a+d+sd+1/fs:1/fs:a+d+sd+r;
 env = [env,s-1*s/(fs*r):-1*s/(fs*r):0];
 t_env = [t_env,trelease];
 
end
