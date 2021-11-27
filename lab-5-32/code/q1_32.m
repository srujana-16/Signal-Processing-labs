%% 5.1 b

w = -10:0.01:10;

%% 1.delta[n]
%  x = 1;
%  No = 1;

%% 2.delta[n+3]
%  x = [1,0,0,0,0,0,0];
%  No = 4;

%% 3.recangular pulse from (-3,3)
%  x = [1,1,1,1,1,1,1];
%  No = 4;

%% 4.sin(w0n) for n = [-200,200]
%  n = -200:200;
%  x = sin(pi*n/4);
%  No = 201;

%% function call
X = DT_Fourier(x,No,w);

%% plotting
subplot(2,2,1)
plot(w,abs(X));
grid on;
xlabel('w');
ylabel('magnitude of FT');
title("subplot 1: magnitude");

subplot(2,2,2)
plot(w,angle(X));
grid on;
xlabel('w');
ylabel('phase of FT');
title("subplot 2: phase");

subplot(2,2,3)
plot(w,real(X));
grid on;
xlabel('w');
ylabel('Real part of FT');
title("subplot 3: Real part");

subplot(2,2,4)
plot(w,imag(X));
grid on;
xlabel('w'); 
ylabel('Imaginary part of FT');
title("subplot 4: Imaginary part");

%% function
function X = DT_Fourier(x,No,w)
X = zeros(size(w));
for k = -1*(No-1):No-1
 X = X + x(k+No)*exp(-1j*w*(k));
end
end

%% 5.2c

%% for b = 0.5
w = -10:0.01:10;
n = 0:100;
b = 0.5;
a = b;
x1 = a.^n;
a = -b;
x2 = a.^n;
No = 1;

%% function call
y1 = DT_Fourier(x1,No,w);
y2 = DT_Fourier(x2,No,w);

%% plotting
sgtitle('b = 0.5');
subplot(2,2,1)
plot(n,x1);
grid on;
xlabel('n');
ylabel('x[n]');
title("x[n] for a = b ");

subplot(2,2,2)
plot(n,x2);
grid on;
xlabel('n');
ylabel('x[n]');
title("x[n] for a = -b");

 subplot(2,2,3)
 plot(w,abs(y1));
 grid on;
 xlabel('w');
 ylabel('DFT');
 title("DFT of x[n] for a = b");

 subplot(2,2,4)
 plot(w,abs(y2));
 grid on;
 xlabel('w'); 
 ylabel('DFT');
 title("DFT of x[n] for a = -b");

%% function
function X = DT_Fourier(x,No,w)
X = zeros(size(w));
for k = No:100
 X = X + x(k)*exp(-1j*w*(k));
end
end

% DTFT plot for x[n] for a = -b is a shifted along the x-axis as compared to the plot for a = b.
% As b increases, DTFT of x[n] is stretched, ie, it's value increases.
% x[n] for a = b: x[n] is a decreasing function having lesses number of non zero values as b increases.
% x[n] for a = -b: fluctuations in x[n] increases as b increases from 0.01 to 0.99. 
