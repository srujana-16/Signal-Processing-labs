function xn = harmonics(A,F0 ,P, td, fs)
N = length(P);
    F = zeros(1,N);
    for t = 1:size(P)
        F(t) = F0*t;
    
    end
    xn = SineSum(A,F,P, td, fs);

end
