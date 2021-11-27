function xn = SineSum(A,F,P, td, fs)

    Ts = 1/fs;
    t_samples = 0:Ts:td;
    xn = zeros(1, td*fs + 1);
    
for k = 1:length(A)
xn = xn + A(k)*sin(2*pi*F(k)*t_samples + P(k));
end
end
