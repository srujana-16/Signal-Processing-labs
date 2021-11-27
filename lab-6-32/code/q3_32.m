fs = 10000;
N = 5;
F0 = 50;
A = zeros(1, N);
P = zeros(1, N);
td = 1;
for j = 1:N
    A(j) = 1/j;
end

[t_env,env] = envelope(0.2,0.2,0.7,0.4,0.2,fs);

xn = harmonics(A,F0,P,td,fs);

yn = xn.*env;
soundsc(yn,fs);

%% plotting

figure ;

subplot(3,1,1)
grid on;
plot(t_env,xn);
xlabel('t env');
ylabel('xn');

subplot(3,1,2)
grid on;
plot(t_env,env);
xlabel('t env');
ylabel('env');

subplot(3,1,3)
grid on;
plot(t_env,xn.*env);
xlabel('t env');
ylabel('xn*env');

function xn = harmonics(A,F0 ,P, td, fs)

 Ts = 1/fs;
 t_samples = 0:Ts:td;
 xn = zeros(1, td*fs + 1);
    
 for k = 1:length(P)
 xn = xn + A(k)*sin(2*pi*k*F0*t_samples + P(k));
 end
 end

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
