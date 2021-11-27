% Fourier series coefficients of the output signal y(t) are bk = ak*H(kw0)
% time period will still be 2pi/w0
%% 2.2 b
% LPF
%defining relevant parameters
% wc = 2;
wc = 2;
N = 10;
w0_FS = 1;
A = zeros(2*N+1,1); % Fourier coeffs of input signal 
A(10) = 0.5;
A(12) = 0.5;
T = 2*pi;
t = -2*T:0.01:2*T;
 
%defining relevant parameters
T = 2;

% function call to find output FS coeffs
B1 = myLPF(A,w0_FS,wc);
 
% function call to compute partial fourier sum
y = partialfouriersum(B1,T,t);
x = partialfouriersum(A, T, t);
 
% plotting
subplot(2,2,1);
plot(t,y);
hold on;
plot(t,x);
grid on;
xlabel('t');
ylabel('FS');
title("wc=2");
legend('y(t)','x(t)');

% wc=0.5;
wc=0.5;
B1 = myLPF(A,w0_FS,wc);
y = partialfouriersum(B1,T,t);
x = partialfouriersum(A, T, t);

% plotting
subplot(2,2,2);
plot(t,y);
hold on;
plot(t,x);
grid on;
xlabel('t');
ylabel('FS');
title("wc=0.5");
legend('y(t)','x(t)');


function B = myLPF(A,w0_FS,wc)

% Compute N based on the length of B
% B has 2N+1 vectors 
S = size(A);
N = (S(1) - 1)/2;
B = zeros(2*N+1,1);
for k = -N:N
    if abs(k*w0_FS) <= wc
         B(k+N+1) = A(k+N+1);
    else 
     B(k+N+1) = 0;
    end
end
end

% function to find partial fourier sum
function Y = partialfouriersum(A, T, t)

% Compute N based on the length of A
% A has 2N+1 vectors  
S = size(A);
N = (S(1) - 1)/2;

w = 2*pi/T;
Y = zeros(size(t));

for k = -N:N
 x = N+k+1;
 % syms t;
 Y = Y + (A(x)*exp(1i*k*w*t));
end
end

% when w_c = 0.5, the output signal is 0, ie for w_c < w0
% in case of HPF the reverse happens. 

%% 2.2 c
% HPF
%defining relevant parameters
% wc=2
wc = 2;
N = 10;
w0_FS = 1;
A = zeros(2*N+1,1);
A(10) = 0.5;
A(12) = 0.5;
T = 2*pi;
t = -2*T:0.01:2*T;
 
%defining relevant parameters
T = 2;

% function call to find output FS coeffs
B1 = myHPF(A,w0_FS,wc);
 
% function call to compute partial fourier sum
y = partialfouriersum(B1,T,t);
x = partialfouriersum(A, T, t);

% plotting
subplot(2,2,1);
plot(t,y);
hold on;
plot(t,x);
grid on;
xlabel('t');
ylabel('FS');
title("wc=2");
legend('y(t)','x(t)');

% wc=0.5
wc=0.5;
B1 = myLPF(A,w0_FS,wc);
y = partialfouriersum(B1,T,t);
x = partialfouriersum(A, T, t);

% plotting
subplot(2,2,2);
plot(t,y);
hold on;
plot(t,x);
grid on;
xlabel('t');
ylabel('FS');
title("wc=0.5");
legend('y(t)','x(t)');


function B = myHPF(A,w0_FS,wc)

% Compute N based on the length of B
% B has 2N+1 vectors 
S = size(A);
N = (S(1) - 1)/2;
B = zeros(2*N+1,1);
for k = -N:N
    if abs(k*w0_FS) <= wc
        B(k+N+1) = 0;
    else 
       B(k+N+1) = A(k+N+1);
    end
end
end

% function to find partial fourier sum
function Y = partialfouriersum(A, T, t)

% Compute N based on the length of A
% A has 2N+1 vectors  
S = size(A);
N = (S(1) - 1)/2;

w = 2*pi/T;
Y = zeros(size(t));

for k = -N:N
 x = N+k+1;
 % syms t;
 Y = Y + (A(x)*exp(1i*k*w*t));
end
end


%% 2.2d
%defining relevant parameters
N = 10;
w0_FS = 1;
A = zeros(2*N+1,1);
A(10) = 0.5;
A(12) = 0.5;
T = 2*pi;
t = -2*T:0.01:2*T;

% function call to find output FS coeffs
B1 = NonIdeal(A,w0_FS,1,1);
 
% function call to compute partial fourier sum
y = partialfouriersum(B1,T,t);
x = partialfouriersum(A, T, t);
 
% plotting
figure;
plot(t,y);
hold on;
plot(t,x);
grid on;
legend('y(t)','x(t)');
xlabel('t');
ylabel('FS');
title('time domain signals corresponding to A and B')

function B = NonIdeal(A,w0_FS,G,a)

% Compute N based on the length of B
% B has 2N+1 vectors 
S = size(A);
N = (S(1) - 1)/2;
B = zeros(2*N+1,1);
for k = -N:N
    H = G/(a+1i*k*w0_FS);
         B(k+N+1) = A(k+N+1)*H;
         
end
end

% function to find partial fourier sum
function Y = partialfouriersum(A, T, t)

% Compute N based on the length of A
% A has 2N+1 vectors  
S = size(A);
N = (S(1) - 1)/2;

w = 2*pi/T;
Y = zeros(size(t));

for k = -N:N
 x = N+k+1;
 % syms t;
 Y = Y + (A(x)*exp(1i*k*w*t));
end
end
%% it gets scaled down by a factor of root 2
%% and there is a phase change of pi/4

%% 2.2e
% LPF
%defining relevant parameters
wc = 2.5;
N = 10;
w0_FS = 1;
A = zeros(2*N+1,1);
A(8) = 0.5;
A(9) = 0.5*1i;
A(13) = -0.5*1i;
A(14) = 0.5;
T = 2*pi;
t = -T/2:0.01:T/2;

 
%defining relevant parameters
T = 2;

% function call to find output FS coeffs
B1 = myLPF(A,w0_FS,wc);
 
% function call to compute partial fourier sum
y = partialfouriersum(B1,T,t);
x = partialfouriersum(A, T, t);
 
% plotting
figure;
plot(t,y);
hold on;
plot(t,x);
grid on;
legend('y(t)','x(t)');
xlabel('t');
ylabel('FS');
title('time domain signals corresponding to A and B')

function B = myLPF(A,w0_FS,wc)

% Compute N based on the length of B
% B has 2N+1 vectors 
S = size(A);
N = (S(1) - 1)/2;
B = zeros(2*N+1,1);
for k = -N:N
    if abs(k*w0_FS) <= wc
         B(k+N+1) = A(k+N+1);
    else 
     B(k+N+1) = 0;
    end
end
end

% function to find partial fourier sum
function Y = partialfouriersum(A, T, t)

% Compute N based on the length of A
% A has 2N+1 vectors  
S = size(A);
N = (S(1) - 1)/2;

w = 2*pi/T;
Y = zeros(size(t));

for k = -N:N
 x = N+k+1;
 % syms t;
 Y = Y + (A(x)*exp(1i*k*w*t));
end
end

%% 2.2 e
% HPF
%defining relevant parameters
wc = 2.5;
N = 10;
w0_FS = 1;
A = zeros(2*N+1,1);
A(8) = 0.5;
A(9) = 0.5*1i;
A(13) = -0.5*1i;
A(14) = 0.5;
T = 2*pi;
t = -T/2:0.01:T/2;

 
%defining relevant parameters
T = 2;

% function call to find output FS coeffs
B1 = myHPF(A,w0_FS,wc);
 
% function call to compute partial fourier sum
y = partialfouriersum(B1,T,t);
x = partialfouriersum(A, T, t);
 
% plotting
figure;
plot(t,y);
hold on;
plot(t,x);
grid on;
legend('y(t)','x(t)');
xlabel('t');
ylabel('FS');
title('time domain signals corresponding to A and B')

function B = myHPF(A,w0_FS,wc)

% Compute N based on the length of B
% B has 2N+1 vectors 
S = size(A);
N = (S(1) - 1)/2;
B = zeros(2*N+1,1);
for k = -N:N
    if abs(k*w0_FS) <= wc
        B(k+N+1) = 0;
    else 
       B(k+N+1) = A(k+N+1);
    end
end
end

% function to find partial fourier sum
function Y = partialfouriersum(A, T, t)

% Compute N based on the length of A
% A has 2N+1 vectors  
S = size(A);
N = (S(1) - 1)/2;

w = 2*pi/T;
Y = zeros(size(t));

for k = -N:N
 x = N+k+1;
 % syms t;
 Y = Y + (A(x)*exp(1i*k*w*t));
end
end
