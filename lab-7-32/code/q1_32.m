% 7.1 a
% P(w) = pi*(delta(w-w0)+delta(w+w0))

% 7.1b
% P(e^jw) = pi*sum over l=-inf to +inf(delta(w-w0*Ts-2*pi*l)+delta(w+w0*Ts-2*pi*l))
% periodic train of impulses

% 7.1c
% the two peaksin a are situated 2w0 apart
% the first two peaks in part b are situated 2*w0*Ts apart

% 7.1d
% e^(-j(w-w0*Ts-2*pi*l)(L-1)/2)*sin((w-w0*Ts-2*pi*l)L/2)sin(w-w0*Ts-2*pi*l)/2) + e^(-j(w+w0*Ts-2*pi*l)(L-1)/2)*sin((w+w0*Ts-2*pi*l)L/2)sin(w+w0*Ts-2*pi*l)/2) 
% infinite shifted sinc like shapes 

f0 = 12;
fs = 64;
Ts = 1/fs;
w0 = 2*pi*f0;
L = 16;

% 7.1e
wn = ones(1,L);

% 7.1f
% L1 = 16;
% wn1 = ones(1,L1);
% N1 = 8*L1;
% f1 = 0:2*pi/N1:2*pi*(N1-1)/N1;
% Z1 = zeros(1,N1-L1);
% wn1 = [wn1,Z1];
% n1 = 0:N1-1;
% pn1 = cos(w0*Ts*n1);
% xn1 = pn1.*wn1;
% Xk1 = fft(xn1);
% 
% L2 = 32;
% wn2 = ones(1,L2);
% N2 = 8*L2;
% f2 = 0:2*pi/N2:2*pi*(N2-1)/N2;
% Z2 = zeros(1,N2-L2);
% wn2 = [wn2,Z2];
% n2 = 0:N2-1;
% pn2 = cos(w0*Ts*n2);
% xn2 = pn2.*wn2;
% Xk2 = fft(xn2);
% 
% L3 = 64;
% wn3 = ones(1,L3);
% N3 = 8*L3;
% f3 = 0:2*pi/N3:2*pi*(N3-1)/N3;
% Z3 = zeros(1,N3-L3);
% wn3 = [wn3,Z3];
% n3 = 0:N3-1;
% pn3 = cos(w0*Ts*n3);
% xn3 = pn3.*wn3;
% Xk3 = fft(xn3);
% 
% L4 = 128;
% wn4 = ones(1,L4);
% N4 = 8*L4;
% f4 = 0:2*pi/N4:2*pi*(N4-1)/N4;
% Z4 = zeros(1,N4-L4);
% wn4 = [wn4,Z4];
% n4 = 0:N4-1;
% pn4 = cos(w0*Ts*n4);
% xn4 = pn4.*wn4;
% Xk4 = fft(xn4);

%% Thelobes bcomes less wide as L is increased
%% Number of side lobes increases
%% As L increases frequency resolution increases

% 7.1g
% f0 = 11;

%7.1h
% wn = hann(L);
% wn = transpose(wn);
%% mainlobe width has increased compared to part e
%% spectral leakage has decreased compared to part e

m1 = 1;
N1 = m1*L;
f1 = 0:2*pi/N1:2*pi*(N1-1)/N1;
Z1 = zeros(1,N1-L);
wn1 = [wn,Z1];
n1 = 0:N1-1;
pn1 = cos(w0*Ts*n1);
xn1 = pn1.*wn1;
Xk1 = fft(xn1);


m2 = 2;
N2 = m2*L;
f2 = 0:2*pi/N2:2*pi*(N2-1)/N2;
Z2 = zeros(1,N2-L);
wn2 = [wn,Z2];
n2 = 0:N2-1;
pn2 = cos(w0*Ts*n2);
xn2 = pn2.*wn2;
Xk2 = fft(xn2);

m3 = 4;
N3 = m3*L;
f3 = 0:2*pi/N3:2*pi*(N3-1)/N3;
Z3 = zeros(1,N3-L);
wn3 = [wn,Z3];
n3 = 0:N3-1;
pn3 = cos(w0*Ts*n3);
xn3 = pn3.*wn3;
Xk3 = fft(xn3);

m4 = 8;
N4 = m4*L;
f4 = 0:2*pi/N4:2*pi*(N4-1)/N4;
Z4 = zeros(1,N4-L);
wn4 = [wn,Z4];
n4 = 0:N4-1;
pn4 = cos(w0*Ts*n4);
xn4 = pn4.*wn4;
Xk4 = fft(xn4);

figure();
subplot(2,2,1)
stem(f1,abs(Xk1));
grid on;
xlabel('k');
ylabel('|Xk|');
title('m = 1');

subplot(2,2,2)
stem(f2,abs(Xk2));
grid on;
xlabel('k');
ylabel('|Xk|');
title('m = 2');

subplot(2,2,3)
plot(f3,abs(Xk3));
grid on;
xlabel('k');
ylabel('|Xk|');
title('m = 4');

subplot(2,2,4)
plot(f4,abs(Xk4));
grid on;
xlabel('k');
ylabel('|Xk|');
title('m = 8');

% 7.1i
% f0 = fs*((1 - ((abs(w2-w1))/(2*pi)))/2)

%  7.1j
% [y,Fs] = audioread("audio files_08.wav");
% Y = zeros(1,length(y));
% for k = 1:length(y)
%     Y(k) = y(k,1);
% end
% Y1 = fft(Y);
% figure();
% plot(abs(Y1));
% grid on;
% xlabel('w');
% ylabel('X[k]');
