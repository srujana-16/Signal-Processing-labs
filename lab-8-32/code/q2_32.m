% 8.2a
a = -1.5:0.01:1.5;
[x,y] = meshgrid(a,a);

z = x+1j*y;
p1 = 0.9;
X_z1 = z./(z-p1);
Y1 = log(abs(X_z1));

% plotting 
figure;
subplot(2,1,1);
mesh(x, y, Y1);
title('p = 0.9');
xlabel('real axis');
ylabel('imaginary axis');
zlabel('log|X_z|');

subplot(2,1,2);
p2 = 1+1j;
X_z2 = z./(z-p2);
Y2 = log(abs(X_z2));
mesh(x, y, Y2);
title('p = 1+j');
xlabel('real axis');
ylabel('imaginary axis');
zlabel('log|X_z|');

% 8.2b
b = (1); % numerator coeffs
a1 = [1,-p1]; % denominator coeffs
a2 = [1,-p2];

figure;
subplot(2,1,1);
zplane(b,a1);
title('p = 0.9');
xlabel('real axis');
ylabel('imaginary axis');

subplot(2,1,2);
zplane(b,a2);
title('p = 1+j');
xlabel('real axis');
ylabel('imaginary axis');

% 8.2c
n = 1001;
% returns the n-point frequency response vector h and the corresponding angular frequency vector w.
[F1,w1] = freqz(b,a1,n);
[F2,w2] = freqz(b,a2,n);
figure;
subplot(2,1,1);
plot(w1,abs(F1));
title('p = 0.9')
xlabel('Frequency');
ylabel ('Magnitude');

subplot(2,1,2);
plot(w2,abs(F2));
title('p = 1+j')
xlabel('Frequency');
ylabel ('Magnitude');

% 8.2d
n = 50;
% returns the impulse response of the digital filter.
% The function returns the response coefficients in h and the sample times in t.
[h1,t1] = impz(b,a1,n);
[h2,t2] = impz(b,a2,n);
figure;
subplot(2,1,1);
stem(t1,h1);
title('p = 0.9')
xlabel('n(samples)');
ylabel ('Amplitude');

subplot(2,1,2);
stem(t2,h2);
title('p = 1+j')
xlabel('n(samples)');
ylabel ('Amplitude');

% 8.2e - a
s = -1.5:0.01:1.5;
[m,n] = meshgrid(s,s);
x = pi/3;
r = 0.95;
z = m+1j*n;
X_z2 = (z*z - 2*cos(x)*z + 1)./(z*z - 2*r*cos(x)*z + r*r);
Y2 = log(abs(X_z2));

% plotting 
figure;
mesh(m, n, Y2);
xlabel('real axis');
ylabel('imaginary axis');
zlabel('log|X_z|');

% 8.2e - b
b = [1,-2*cos(x),1];
a = [1,-2*r*cos(x),r*r];

figure;
zplane(b,a);
xlabel('real axis');
ylabel('imaginary axis');

% 8.2e - c
n = 1001;
% returns the n-point frequency response vector h and the corresponding angular frequency vector w.
[F,w] = freqz(b,a,n);
figure;
plot(w,abs(F));
xlabel('Frequency');
ylabel ('Magnitude');

% 8.2e - d
n = 50;
% returns the impulse response of the digital filter.
% The function returns the response coefficients in h and the sample times in t.
[h,t] = impz(b,a,n);
figure;
stem(t,h);
xlabel('n(samples)');
ylabel ('Amplitude');

% 8.2d
% 2 signals, because there is only one pole which is non zero which means -> 2 ROCs and each have one signal.
% the signals are x1(n) = (p^n)*u(n) and x2(n) = -(p^n)*u(-n-1)
% here, the impz() function returns x1(n).

% 8.2f
% let a = theta
% zeros at - cos(a)+isin(a)
% poles at - r{cos(a)+isin(a)}
