%defining relevant parameters
T1 = 0.1;
T = 1;
time_grid = -0.5:0.01:0.5;
N = 10*T; % N = 10
t1= -T1;
t2 = T1;

% defining relevant expressions
syms t;
xt = 1; % square wave

% function call to find FS coefficients
F1 = fourierCoeff(t,xt,T,t1,t2,N);

% function call to find partial fourier sum
F2 = partialfouriersum(F1,T,time_grid);

% plotting
figure; 
stem(time_grid,F2); 
grid on;
xlabel('t');
ylabel('real part of x(t)');
title('Reconstructed square wave');

% function to find FS coefficients
function A = fourierCoeff(t,xt,T,t1,t2,N)
p = 1;
A = zeros(2*N+1,1);
for k = -N:N
    syms t;
    expr = xt*exp((-1i*k*2*pi*t)/T);
    A(p) = int(expr,t,[t1 t2]);
    p = p + 1;
end
end

% function to find partial fourier sum
function Y = partialfouriersum(A, T, time_grid)

% Compute N based on the length of A
% A has 2N+1 vectors  
S = size(A);
N = (S(1) - 1)/2;

w = 2*pi/T;
Y = zeros(size(time_grid));

for k = -N:N
 x = N+k+1;
 % syms t;
 Y = Y + (A(x)*exp(1i*k*w*time_grid));
end
end

% Computed the partial Fourier sum from a given vector of Fourier series coefficients { 𝑎𝑘 } and 
% reconstructed the square wave using the function “partialfouriersum” and ploted it
% Repeated this as N is increased (N = 50,100,1000). 
% As N keeps increasing the plot gradually loses it's sinc shape, as t tends to 0 the real part of x(t) keeps increasing. 
