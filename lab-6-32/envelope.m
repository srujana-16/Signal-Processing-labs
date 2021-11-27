function [t_env,env] = envelope(a,d,s,sd,r,fs)
% For each portion of the note, determine the corresponding piece of time vector and envelope.
% Attack: amplitude linearly increases from 0 to 1 in ‘a’ seconds
tattack = 0:1/fs:a;
env = ...% write your code here
t_env = tattack;
% Decay: amplitude linearly decreases from 1 to ‘s’ in ‘d’ seconds
tdecay = (a+1/fs):1/fs:a+d; 
t_env = [t_env, tdecay];
env = [env, ...];% write your code here
% Sustain: amplitude stays at ‘s’ for ‘sd’ seconds
tsustain = ...% write your code here
t_env = [t_env, tsustain];
env = [env, ...];% write your code here
% Release: amplitude linearly decreases from ‘s’ to 0 in ‘r’ seconds
trelease = ...% write your code here
t_env = [t_env, trelease];
env = [env, ...];% write your code here

end