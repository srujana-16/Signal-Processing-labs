% audioread() = function used to load the audio file in to your matlab workspace
% Using uigetfile() function to get the path to the audio file.
% Fs = sampling rate (number of samples per second)
% N = length of signal
% t = The duration of each of the audio signals in seconds = N/Fs
% output = sound(y,Fs) - Used to listen to the audio file y at the sampling rate Fs

[w,Fs1] = audioread('/MATLAB Drive/New Folder/file_example_WAV_1MG.wav');
N1 = length(w); 
t1 = N1/Fs1;
% sound(w,Fs1);

[x,Fs2] = audioread('/MATLAB Drive/New Folder/file_example_WAV_2MG.wav');
N2 = length(x); 
t2 = N2/Fs2;
% sound(x,Fs2);

[y,Fs3] = audioread('/MATLAB Drive/New Folder/file_example_WAV_5MG.wav');
N3 = length(y); 
t3 = N3/Fs3;
% sound(y,Fs3);

[z,Fs4] = audioread('/MATLAB Drive/New Folder/file_example_WAV_10MG.wav');
N4 = length(z); 
t4 = N4/Fs4;

% % true sampling frequency
% sound(z,Fs4); 

% % lower sampling rates
% sound(z,Fs4*0.9);
% sound(z,Fs4*0.8);
% sound(z,Fs4*0.6);
% 
% % higher sampling rates
% sound(z,1.2*Fs4);
% sound(z,1.4*Fs4);
% sound(z,1.6*Fs4);

% Bit depth (B) is the number of bits available for each sample . 
% The higher the bit depth, the higher the quality of the audio.
% Frequency × bit depth × channels = bit rate
% Number of levels = 2^B  

% Using lower sampling frequency than the true 𝑓𝑠:
% The sample rate is how many samples of the sound are taken each second. 
% The lesser samples that are taken, lesser is the detail about where the waves rise and fall is recorded
% lesser is the quality of the audio.
% It also changes the play time.

% Using higher sampling frequency than the true 𝑓𝑠:
% The higher the sample rate, the higher frequencies a system can record.
% If we increase the sampling frequency, the distance between the desired component and Fs/2 increases.
% It also changes the play time.

% The property of Fourier transform that can be used to explain the observations above is frequency scaling
