%1.3b
 
% %defining relevant parameters
T = 1;
N = 10*T;
T1 = 0.1; 
t1 = -T1;
t2 = T1;

% defining relevant expressions
syms t;
xt = 1; % square wave

% function call to find FS coefficients
F1 = fourierCoeff(t,xt,T,t1,t2,N)

% plotting
FS_idx = -N:N;
figure; 
stem(FS_idx,F1); 
grid on;
xlabel('t');
ylabel('ak');


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


% As T increases or equivalently w0 decreases, the fourier coefficients come closer. 
% As T->infinity (the periodic square wave becomes a rectangular pulse), the set of coefficients approach the envelope function.
