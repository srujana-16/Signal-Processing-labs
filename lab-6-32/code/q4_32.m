fs = 10000;
N = 5;
A = zeros(1, N);
P = zeros(1, N);
for t = 1:N
    A(t) = 1/t;
end

% 6.4a
M = 11;
F_notes = 50:5:100;
td_notes = 2*ones(1,M);
adsr = [0.2,0.2,0.7,0.4,0.2];

% 6.4b
% M = 7;
% F_notes = 100:-10:40;
% td_notes = ones(1,M);
% adsr = [0.2,0.2,0.7,0.4,0.2];

% 6.4c
% M = 5;
% F_notes = 50 + 50*rand(1,M);;
% td_notes = 0.5 + rand(1,M);
% adsr = [0.2,0.2,0.7,0.4,0.2];


yn =  my_synthesizer(A,F_notes,P,adsr,td_notes,fs);


soundsc(yn,fs);
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
 
function y = my_synthesizer(A,F_notes,P,adsr,td_notes,fs)
 y = [];

 for ii = 1:length(F_notes)
    
    [~,env] = envelope(adsr(1)*td_notes(ii),adsr(2)*td_notes(ii),adsr(3),adsr(4)*td_notes(ii),adsr(5)*td_notes(ii),fs);
   
    xt = harmonics(A,F_notes(ii),P,td_notes(ii),fs);
    
    xte = xt.*env;
    
    y = [y,xte];
end

end

% 6.4e
% filename = 'music.wav';
% audiowrite(filename,yn,fs);


% i = (1/fs)<5 ;
% yn = yn(i) 
% audiowrite('tune.wav', yn, fs); %saving the audiofile of the sound signal.
