%1.1a

%defining relevant parameters
N = 5;
T = 1; 
t1 = -T/2;
t2 = T/2;

% defining relevant expressions
syms t;
xt = 2*cos(2*pi*t) + cos(6*pi*t); % sum of cosines wave

% function call to find FS coefficients
F1 = fourierCoeff(t,xt,T,t1,t2,N)

% plotting
FS_idx = -N:N;
figure; 
stem(FS_idx,F1); 
grid on;

% 1.1b

% defining relevant parameters
N = 10;
T = 1;
T1 = T/4;
t1 = -T1;
t2 = T1;

% defining relevant expressions
syms t;
xt = 1; % xt is 1 between -T1 and +T1
        % 0 for other values in the time period

% function call to find FS coefficients
F2 = fourierCoeff(t,xt,T,t1,t2,N);

% plotting
FS_idx = -N:N;
figure; stem(FS_idx,F2); grid on;

% function to find FS coefficients
function A = fourierCoeff(t,xt,T,t1,t2,N)
p = 1;
A = zeros(2*N+1,1);
for k = -N:N
 %  syms t;
    expr = xt*exp((-1i*k*2*pi*t)/T);
    A(p) = int(expr,t,[t1 t2])/T;
 p = p + 1;
end
end

% The FS coefficients for the given periodic signal x(t) are computed by calling the “fourierCoeff” function. 
% The “fourierCoeff” function returns a vector which contains the Fourier series coefficients { 𝑎−𝑁..., 𝑎−1,𝑎0,𝑎1,... 𝑎𝑁,}.
