% 1.4b
%defining relevant parameters
N = 5;
T = 1; 
t1 = -T/4;
t2 = T/4;

% defining relevant expressions
syms t;
xt = t;

% function call to find FS coefficients
F = fourierCoeff(t,xt,T,t1,t2,N)

% plotting
FS_idx = -N:N;
figure; 
stem(FS_idx,imag(F)); 
grid on;
xlabel('time');
ylabel('FS coefficients');

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

% 1.4c
% The function f(x) = x, given is odd.
% The expected FS coefficients are purely complex.
% A(-x) = -A(x), here A(x) is the FS coefficients array ,ie, the output.


