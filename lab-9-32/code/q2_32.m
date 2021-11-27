% 9.2a
b0 = 1/2*(1 - cos(pi/4)); 
b = [b0,-2*b0*cos(pi/4),b0];
a = 1;
[h,w] = freqz(b,a,2001);
plot(w,abs(h));
fvtool(b,a);

% 9.2b
r0 = 0.99;
b0 = (1 + r0*r0 - 2*r0*cos(pi/4))/2*(1 - cos(pi/4));
b = [b0,-2*b0*cos(pi/4),b0];
a = [1,-2*r0*cos(pi/4),r0*r0];
[h,w] = freqz(b,a,2001);
plot(w,abs(h));
fvtool(b,a);

% 9.2c
% FIR filter is causal and stable
% IIR filter is causal and stable if ROC is |z|>r0. It is anti-causal and unstable if |z| < r0

% 9.2d
% The transition from stop band frequency to pass band frequency becomes quicker as we increase r0 from 0.5 to 0.99

% 9.2e  

load handel;
T = length(y);
% sound(y);
y = transpose(y);
x = zeros(1,T);
for k=1:length(y)
x = sin(2*pi*1024*(k-1)/Fs);
end

yn = y + x;

% sound(yn);

b01 = 1/2*(1 - cos(pi/4)); 
b1 = [b01,-2*b01*cos(pi/4),b01];
a1 = 1;

r0 = 0.99;
b02 = (1 + r0*r0 - 2*r0*cos(pi/4))/2*(1 - cos(pi/4));
b2 = [b02,-2*b02*cos(pi/4),b02];
a2 = [1,-2*r0*cos(pi/4),r0*r0];

[Y1,n1] = filter(b1,a1,yn);
[Y2,n2] = filter(b2,a2,yn);

% sound(Y1);
% sound(Y2);

% 9.2f
figure(1);

subplot(2,2,1)
plot(yn(1:100));
grid on;
xlabel('w');
ylabel('yn');
title('yn (filter 1)');

subplot(2,2,2)
plot(Y1(1:100));
grid on;
xlabel('w');
ylabel('Y1');
title('Filtered signal Y1 (filter 1)');

subplot(2,2,3)
plot(yn(1:100));
grid on;
xlabel('w');
ylabel('yn');
title('yn (filter 2)');

subplot(2,2,4)
plot(Y2(1:100));
grid on;
xlabel('w');
ylabel('Y2');
title('Filtered signal Y2 (filter 2)');
