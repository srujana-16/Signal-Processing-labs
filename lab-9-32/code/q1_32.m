% h_lpf[n] = sin(wn)/pi*n, where w = pi/6 ---> sinc 
% h_d[n] = sin(w*(n-nc))/pi*(n-nc), where w = pi/6 ---> shifted sinc

N = 51;
nc = (N-1)/2;
w = pi/6;
h_d = zeros(1,N);
n = 0:1:50;
for p = 0:50
h_d(p+1) = sin(w*(p-nc))/(pi*(p-nc));
if p == 25
    h_d(p+1) = 1/6;
end
end

%% 9.1a
wn1 = ones(1,N); % rectangular window
hn1 = h_d.*wn1;

%% 9.1c
% wn2 = blackman(N);
% wn2 = transpose(wn2);
% hn2 = h_d.*wn2;

%% 9.1f
% h1_n = hn1.*(-1).^n;
% It is a high pass filter.

%% 9.1b
y = fft(h1_n, 1001);
k = 0:1:1000;
figure;
sgtitle('w[n]- rectangular window, h1[n] = h[n](-1)^n');
subplot(3,1,1);
grid on;
plot(n,h1_n,'red');
title('coefficients of h[n]');
xlabel('n');

MAG = abs(y);
MAG_dB = 20*log10(MAG/max(MAG));
subplot(3,1,2);
grid on;
ylim([-100,10]);
plot(k,MAG_dB,'m');
xlabel('k');
ylabel('DFT magnitude in decibels')
title('DFT magnitude');

subplot(3,1,3);
grid on;
plot(k,angle(y));
title('DFT phase');
xlabel('k');
ylabel('phase');

% the phase is linear for the FIR filter.

%% 9.1d
% The rectangular window filter in 9.1b has a smaller transition period than blackman window filter.
% The side lobes dipped lower and more -ve magnitude and is uniform for the blackman window.

%% 9.1e
N = 0:1:200;
% xn = cos(pi*N/16)+0.25*sin(pi*N/2);
yn1 = 0.25.*randn(1,201);
xn1 = cos(pi*N/16);
xn = xn1 +yn1;
%plotting
figure;
grid on;
stem(xn(1:201));
title('x1[n]');
xlabel('n');

y1 = conv(xn,hn1,"same");
y2 = conv(xn,hn2,"same");

figure;
subplot(2,2,1);
grid on;
sgtitle('x1[n]');
plot(N,xn);
title('original signal - rectangular window');
subplot(2,2,2);
grid on;
plot(N,xn);
title('original signal - blackman window');
subplot(2,2,3);
grid on;
plot(N,y1);
title('filtered signal - rectangular window');
subplot(2,2,4);
grid on;
plot(N,y2);
title('filtered signal - rectangular window');


