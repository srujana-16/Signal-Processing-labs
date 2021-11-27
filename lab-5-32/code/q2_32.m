%% 5.2a
% The impulse response of a system, h[n], is the output that it produces in response to an impulse input.
% ie, if and only if x[n] = δ[n] then y[n] = h[n]
% Given the system equation,we can find the impulse response just by feeding x[n] = δ[n] into the system.
% Therefore for the given system, h[n] = 1/M for n=0,1,2...M-1 
% h[n] = 0 otherwise 

%% 5.2c
w0 = pi/200;
n = 0:1:1000;
M = 5; 

vn = randn(1,1001);
sn = 5*sin(w0*n);
xn =  sn + vn;

%% 5.2d
hn = 1/M*ones(1, M);

yn = conv(xn,hn,'full');

% plotting 
figure(1);

subplot(2,2,1);
plot(n,sn);
grid on; 
hold on;
plot(n,xn);
xlabel('n');
title('s[n] and x[n]');
legend('s[n]', 'x[n]');

subplot(2,2,2);
plot(n,sn);
grid on;
hold on;
plot(yn);
xlabel('n');
title('M = 5');
legend('original signal', 'filtered signal');

% M = 21
M = 21; 
hn = 1/M*ones(1, M);
yn = conv(xn,hn,'full');

subplot(2,2,3);
plot(n,sn);
grid on;
hold on;
plot(yn);
xlabel('n');
title('M = 21');
legend('original signal', 'filtered signal');

% M = 51
M = 51; 
hn = 1/M*ones(1, M);
yn = conv(xn,hn,'full');

subplot(2,2,4);
plot(n,sn);
grid on;
hold on;
plot(yn);
xlabel('n');
title('M = 51');
legend('original signal', 'filtered signal');


%% 5.2e
% The graphs become smoother as M is increased
% But as M increases the delay also increases
% So the trade-off is between smoothing and delay

%% 5.2f
% As M is increased the frequencies corresponding to the white noise is attenuated.
% Which makes sense because the overshoots in the signal are due to white noise
% and the filter takes average of the current and next M-1 values so the spikes in the graph gets smoothened hence eliminating some frequencies
w0 = pi/200;
n = 0:1:1000;
vn = randn(1,1001);
sn = 5*sin(w0*n);
xn =  sn + vn;

M = 5; 
hn = 1/M*ones(1, M);

yn = conv(xn,hn,'full');
w = -10:0.01:10;
X = DT_Fourier(xn,1,w);
Y = DT_Fourier(yn,1,w);

% plotting
figure(2);

sgtitle('DTFT');
 subplot(2,2,1)
 plot(w,abs(X));
 grid on;
 xlabel('w');
 ylabel('DTFT');
 title("Noisy signal");

 subplot(2,2,2)
 plot(w,abs(X));
 grid on;
 hold on;
 plot(w,abs(Y));
 xlabel('w');
 ylabel('DTFT');
 title("M = 5");
 legend('noisy signal', 'filtered signal');
 
 % M = 21
 M = 21; 
hn = 1/M*ones(1, M);

yn = conv(xn,hn,'full');
w = -10:0.01:10;
X = DT_Fourier(xn,1,w);
Y = DT_Fourier(yn,1,w);

 subplot(2,2,3)
 plot(w,abs(X));
 grid on;
 hold on;
 plot(w,abs(Y));
 xlabel('w');
 ylabel('DTFT');
 title("M = 21");
 legend('noisy signal', 'filtered signal');
 
 % M = 51
 M = 51; 
hn = 1/M*ones(1, M);

yn = conv(xn,hn,'full');
w = -10:0.01:10;
X = DT_Fourier(xn,1,w);
Y = DT_Fourier(yn,1,w);

 subplot(2,2,4)
 plot(w,abs(X));
 grid on;
 hold on;
 plot(w,abs(Y));
 xlabel('w');
 ylabel('DTFT');
 title("M = 51");
 legend('noisy signal', 'filtered signal');

function X = DT_Fourier(x,No,w)
X = zeros(size(w));
for k = No:1000
 X = X + x(k)*exp(-1*1j*w*(k-1));
end
end

%% 5.2g 
% Given the system equation,we can find the impulse response just by feeding x[n] = δ[n] into the system.
% Therefore, h[n] = 1 for n = 0
% h[n] = -1 for n = 1 else h[n] = 0.
% The frequencies corresponding to the white noise is amplified where as the original ginal is attenuated.
w0 = pi/200;
n = 0:1:1000;

vn = randn(1,1001);
sn = 5*sin(w0*n);
xn =  sn + vn;

hn = [1, -1];

yn = conv(xn,hn,'full');
w = -10:0.01:10;
X = DT_Fourier(xn,1,w);
Y = DT_Fourier(yn,1,w);

% DTFT PLOTS
figure(3)
 subplot(2,1,1)
 plot(w,abs(X));
 grid on;
 xlabel('w');
 ylabel('DTFT');
 title('noisy signal');
 
 subplot(2,1,2)
 grid on;
 plot(w,abs(Y));
 xlabel('w');
 ylabel('DTFT');
 title('filtered signal');

function X = DT_Fourier(x,No,w)
X = zeros(size(w));
for k = No:1000
 X = X + x(k)*exp(-1*1j*w*(k-1));
end
end

%% 5.2h
% In terms of frequency selectivity, the moving average  filter behaves like an inverse notch filter( atenuates certain periodic frequencies to zero),
% which is a narrow band pass filter. ( It behaves in some sense like a low pass filter)
% For the second relation, a finite impulse response filter is used whose impulse response is of finite duration, because it settles to zero in finite time.

