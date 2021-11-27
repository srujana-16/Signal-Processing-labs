%% 5.2a

function X = DT_Fourier(x,No,w)
X = zeros(size(w));
for k = -1*(No-1):No-1
 X = X + x(k+No)*exp(1j*w*(k));
end
end
