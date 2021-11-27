% 7.2a
N = 10;
x1 = randn(1,N);
x2 = [0,0,0,1,0,0,0,0,0,0];

% 7.2b
c_conv = cconv(x1,x2,N);
l_conv = conv(x1,x2);

% 7.2c
% Compute order-N circular convolution based on FFTs 
conv_circ = ifft(fft(x1,10).*fft(x2,10));

% Compute linear convolution based on FFTs
conv_lin = ifft(fft(x1,2*N).*fft(x2,2*N));

% plotting
figure;
sgtitle('linear and circular convolutions')
subplot(2,2,1);
grid on;
stem(conv_circ);
xlabel('n');
ylabel('x[n]');
title("Circular Convolution");

subplot(2,2,2);
grid on;
stem(c_conv);
xlabel('n');
ylabel('x[n]');
title("Circular Convolution using In-Built Functions");

subplot(2,2,3);
grid on;
stem(conv_lin);
xlabel('n');
ylabel('x[n]');
title("Linear Convolution");

subplot(2,2,4);
grid on;
stem(l_conv);
xlabel('n');
ylabel('x[n]');
title("Linear Convolution using In-Built Functions");

