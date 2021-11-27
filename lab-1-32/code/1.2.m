%1.2a

%defining relevant parameters
T = 1;
time_grid = -0.5:0.01:0.5;

% taking output of 1.1a as input for partialfouriersum
%defining relevant parameters
N = 5;
t1 = -T/2;
t2 = T/2;

% defining relevant expressions
syms t;
xt = 2*cos(2*pi*t) + cos(6*pi*t); % sum of cosines wave
yt = 2*cos(2*pi*time_grid) + cos(6*pi*time_grid);

% function call to find FS coefficients
F1 = fourierCoeff(t,xt,T,t1,t2,N);

% function call to find partial fourier sum
F2 = partialfouriersum(F1,T,time_grid);

%1.2b

% plotting
figure;
plot(time_grid,yt);
hold on;
plot(time_grid,real(F2));
grid on;
xlabel('t');
ylabel('real part of x(t)');
legend ('original function','reconstructed');
title('Original Vs reconstructed');

% 1.2c

% maximum absolute error (MAE) 
MAE = max(abs(yt-real(F2)));

% root mean squared (RMS) error
RMSE = sqrt(mean((yt-real(F2)).^2));


% function to find FS coefficients
function A = fourierCoeff(t,xt,T,t1,t2,N)
p = 1;
A = zeros(2*N+1,1);
for k = -N:N
    % syms t;
    expr = xt*exp((-1i*k*2*pi*t)/T);
    A(p) = int(expr,t,[t1 t2])/T;
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

% The partial Fourier sum is computed from a given vector of Fourier series coefficients { 𝑎𝑘 }, by calling the “partialfouriersum” function. 
% As the order N is increased (to infinity) the partial sum approaches the original signal 𝑥(𝑡).
% The “partialfouriersum” function returns the vector y,
% which corresponds to the Fourier series reconstruction signal 𝑦(𝑡) obtained from computing the partial Fourier sum from -N to N.
