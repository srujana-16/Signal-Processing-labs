%% 2.1a 
% function to to compute continuous-time FT
function X = continuousFT(t,xt,a,b,w)
  X = zeros(100,1);
  syms t;
  for k = 1:100
   expr = xt*exp(-1i*w(k)*t);
   X(k) = int(expr,t,[a b]);
  end
end

% The function returns a vector X which contains the FT of 𝑥(𝑡) for each of the frequencies in the input vector ω.

%% 2.1 b

%defining relevant parameters
T = 2;
w = -5:0.1:5;
a = -T;
b = T;

% defining relevant expressions
% rectangular pulse 
syms t;
xt = 1; % xt is 1 between -T and +T

% function call to compute continuous-time FT
F1 = continuousFT(t,xt,a,b,w);

% plotting 
subplot(2,2,1);
x = linspace(-5,5,100);
plot(x,real(F1));
grid on;
xlabel('w');
ylabel('real part of FT');
title("subplot 1: real part");

subplot(2,2,2);
plot(x, imag(F1));
grid on;
xlabel('w');
ylabel('imag part of FT');
title("subplot 2: imaginary part");

subplot(2,2,3);
plot(x,abs(F1));
grid on;
xlabel('w');
ylabel('absolute value of FT');
title("subplot 3: absolute value");

subplot(2,2,4);
plot(x, angle(F1));
grid on;
xlabel('w');
ylabel('phase of FT');
title("subplot 4: phase");

% function to to compute continuous-time FT
function X = continuousFT(t,xt,a,b,w)
  X = zeros(100,1);
  syms t;
  for k = 1:100
   expr = xt*exp(-1i*w(k)*t);
   X(k) = int(expr,t,[a b]);
  end
end

% Real part: sinc function 
% imaginary part: FT is 0 for all w
% absolute value: abs of sinc function 
% phase: 

%% 2.1c
% T=1 
%defining relevant parameters
T = 1;
w = -5:0.1:5;
a = -T;
b = T;

% defining relevant expressions
% rectangular pulse 
syms t;
xt = 1; % xt is 1 between -T and +T

% function call to compute continuous-time FT
F1 = continuousFT(t,xt,a,b,w);

% plotting 
subplot(2,2,1);
x = linspace(-5,5,100);
plot(x,real(F1));
grid on;
xlabel('w');
ylabel('real part of FT');
title("subplot 1: real part");

subplot(2,2,2);
plot(x, imag(F1));
grid on;
xlabel('w');
ylabel('imag part of FT');
title("subplot 2: imaginary part");

subplot(2,2,3);
plot(x,abs(F1));
grid on;
xlabel('w');
ylabel('absolute value of FT');
title("subplot 3: absolute value");

subplot(2,2,4);
plot(x, angle(F1));
grid on;
xlabel('w');
ylabel('phase of FT');
title("subplot 4: phase");

% function to to compute continuous-time FT
function X = continuousFT(t,xt,a,b,w)
  X = zeros(100,1);
  syms t;
  for k = 1:100
   expr = xt*exp(-1i*w(k)*t);
   X(k) = int(expr,t,[a b]);
  end
end

%% 2.1c 
% T = 4
%defining relevant parameters
T = 4;
w = -5:0.1:5;
a = -T;
b = T;

% defining relevant expressions
% rectangular pulse 
syms t;
xt = 1; % xt is 1 between -T and +T

% function call to compute continuous-time FT
F1 = continuousFT(t,xt,a,b,w);

% plotting 
subplot(2,2,1);
x = linspace(-5,5,100);
plot(x,real(F1));
grid on;
xlabel('w');
ylabel('real part of FT');
title("subplot 1: real part");

subplot(2,2,2);
plot(x, imag(F1));
grid on;
xlabel('w');
ylabel('imag part of FT');
title("subplot 2: imaginary part");

subplot(2,2,3);
plot(x,abs(F1));
grid on;
xlabel('w');
ylabel('absolute value of FT');
title("subplot 3: absolute value");

subplot(2,2,4);
plot(x, angle(F1));
grid on;
xlabel('w');
ylabel('phase of FT');
title("subplot 4: phase");

% function to to compute continuous-time FT
function X = continuousFT(t,xt,a,b,w)
  X = zeros(100,1);
  syms t;
  for k = 1:100
   expr = xt*exp(-1i*w(k)*t);
   X(k) = int(expr,t,[a b]);
  end
end

%% If a function is expanded in time by a quantity a, the Fourier Transform is compressed in frequency by the same amount.
%% x(t)<---->X(w)
%% x(at)<--->X(w/a)/|a|

%% 2.1 d 
% 𝑥(𝑡) = cos (𝑡).
%defining relevant parameters
T = pi;
w = -5:0.1:5;
a = -T;
b = T;

% defining relevant expressions
syms t;
xt = cos(t); % xt is 1 between -T and +T

% function call to compute continuous-time FT
F1 = continuousFT(t,xt,a,b,w);

% plotting 
subplot(2,2,1);
w = linspace(-5,5,100);
plot(w,real(F1));
grid on;
xlabel('w');
ylabel('real part of FT');
title("subplot 1: real part");

subplot(2,2,2);
plot(w, imag(F1));
grid on;
xlabel('w');
ylabel('imag part of FT');
title("subplot 2: imaginary part");

subplot(2,2,3);
plot(w,abs(F1));
grid on;
xlabel('w');
ylabel('absolute value of FT');
title("subplot 3: absolute value");

subplot(2,2,4);
plot(w, angle(F1));
grid on;
xlabel('w');
ylabel('phase of FT');
title("subplot 4: phase");

% function to to compute continuous-time FT
function X = continuousFT(t,xt,a,b,w)
  X = zeros(100,1);
  syms t;
  for k = 1:100
   expr = xt*exp(-1i*w(k)*t);
   X(k) = int(expr,t,[a b]);
  end
end

% expected output: 2 frequency shifted unit impulse functions
% observed: The 2 highest peaks show where the impulse should be. 
% however as we calculated it's FT over [-T,T] and not (-infinity,infinity), it is not perfect. 

%% 2.1d
% 𝑥(𝑡) = e^jt
%defining relevant parameters
T = 2;
w = linspace(-5,5,100);
a = -T;
b = T;

% defining relevant expressions
syms t;
xt = exp(1it); % xt is 1 between -T and +T

% function call to compute continuous-time FT
F1 = continuousFT(t,xt,a,b,w);

% plotting 
subplot(2,2,1);
plot(w,real(F1));
grid on;
xlabel('w');
ylabel('real part of FT');
title("subplot 1: real part");

subplot(2,2,2);
plot(w, imag(F1));
grid on;
xlabel('w');
ylabel('imag part of FT');
title("subplot 2: imaginary part");

subplot(2,2,3);
plot(w,abs(F1));
grid on;
xlabel('w');
ylabel('absolute value of FT');
title("subplot 3: absolute value");

subplot(2,2,4);
plot(w, angle(F1));
grid on;
xlabel('w');
ylabel('phase of FT');
title("subplot 4: phase");

% function to to compute continuous-time FT
function X = continuousFT(t,xt,a,b,w)
  X = zeros(100,1);
  syms t;
  for k = 1:100
   expr = xt*exp(-1i*w(k)*t);
   X(k) = int(expr,t,[a b]);
  end
end

% scaled and frequency shifted impulse function is expected, ie 2*pi*delta(w-1).
% observed: The graph is not a perfect impulse because we calculated it's FT over [-T,T] and not (-infinity,infinity)

%% 2.1e
%defining relevant parameters
T = 2;
w = linspace(-5,5,100);
a = -T;
b = T;

% defining relevant expressions
syms t;
xt = 1-abs(t); % xt is 1 between -T and +T

% function call to compute continuous-time FT
F1 = continuousFT(t,xt,a,b,w);

% plotting 
subplot(2,2,1);
plot(w,real(F1));
grid on;
xlabel('w');
ylabel('real part of FT');
title("subplot 1: real part");

subplot(2,2,2);
plot(w, imag(F1));
grid on;
xlabel('w');
ylabel('imag part of FT');
title("subplot 2: imaginary part");

subplot(2,2,3);
plot(w,abs(F1));
grid on;
xlabel('w');
ylabel('absolute value of FT');
title("subplot 3: absolute value");

subplot(2,2,4);
plot(w, angle(F1));
grid on;
xlabel('w');
ylabel('phase of FT');
title("subplot 4: phase");

% function to to compute continuous-time FT
function X = continuousFT(t,xt,a,b,w)
  X = zeros(100,1);
  syms t;
  for k = 1:100
   expr = xt*exp(-1i*w(k)*t);
   X(k) = int(expr,t,[a b]);
  end
end

% triangle pulse can be expressed as convolution of two rectangular pulses.
% T(t)=R(t)*R(t)
% T(w)=R(w).R(w)
%     =sinc^2
