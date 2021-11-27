% % 7.3a
% N = 4;
% L = 4;
% fs = 1;
% n = 0:1/fs:(N-1);
% x = [ones(L,1);zeros(N-L,1)];
% y = fft(x);

% % 7.3b
% fs = 1; 
% N = 20;
% n = 0:1/fs:(N-1);
% w0 = 3*pi/10;
% x = sin(w0*n);
% y = fft(x);

% % 7.3c
% w0 = 3*pi/10;
% N = 20;
% fs = 1;
% n = 0:1/fs:(N-1);
% x = cos(w0*n);
% y = fft(x);

% % 7.3d
% w0 = 3*pi/10;
% N = 20;
% fs = 1;
% n = 0:1/fs:(N-1);
% x = sin(w0*(n-1));
% y = fft(x);

% % 7.3e
% N = 20;
% x = (0.8).^n;
% fs = 1;
% n = 0:1/fs:(N-1);
% y = fft(x);

% 7.3f
N = 20;
fs = 1;
n = 0:1/fs:(N-1);
x = (-0.8).^n;
y = fft(x);

%plotting
figure(6);
sgtitle('(-0.8)^n');

subplot(3,1,1);
stem(n, y);
grid on;
ylabel('sequence');

subplot(3,1,2);
stem(n, abs(y));
grid on;
ylabel('magnitude');

subplot(3,1,3);
stem(n, angle(y));
grid on;
ylabel('phase');

% As the value of k is closer to N/2, the frequencies are higher.
% As k is closer to 0 or 2pi, the frequencies are lesser
