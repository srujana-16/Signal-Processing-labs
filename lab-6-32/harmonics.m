function xn = harmonics(A,F0 ,P, td, fs)

    Ts = 1/fs;
    t_samples = 0:Ts:td;
    xn = zeros(1, td*fs + 1);
    
for k = 1:length(P)
xn = xn + A(k)*sin(2*pi*k*F0*t_samples + P(k));
end
end
