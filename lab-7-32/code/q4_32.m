% N1 = 8;
% f0 = 12;
% fs = 64;
% Ts = 1/fs;
% w0 = 2*pi*f0;
% n1 = 0:N1-1;
% k = sin(w0*Ts*n1);
% 
% F1 = radix2fft(k);

function X = radix2fft(x)
    % size(x) = 1x8
	N = size(x,2);
	X = zeros(1,N);
   if (N == 1)
       X = x;
   elseif N == 2
		% Compute length-2 DFT directly
		X = [x(1) + x(2), x(1) - x(2)];
   else
		% split into even and odd parts
		x_even = x(1:2:end);
		x_odd =x(2:2:end);
		% radix 2 FFT of each part
		X_even = radix2fft(x_even);
		X_odd = radix2fft(x_odd);
		% recombine length N/2 results into length N result
		for k=1:(N/2)
			X(1,k) = X_even(k) + exp(-1j.*2.*pi.*(k-1)./N).*X_odd(k);
			X(1,k+N/2) = X_even(k) - exp(-1j.*2.*pi.*(k-1)./N).*X_odd(k);
        end
	 end
end

% N = 2, we compute length-2 DFT directly
% X = [x(1) + x(2), x(1) - x(2)];
        
    	
