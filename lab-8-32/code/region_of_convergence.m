function [N,ROC,ROC_zero]=region_of_convergence(p)
A = abs(p);
C = unique(A);

    if C(1)==0
        ROC_zero = 0;
        N = length(C);
        ROC = zeros(N,2);
        ROC(1,1)=0;
        for k = 1:length(C)-1
         ROC(k,2) = C(k);
         ROC(k+1,1) = C(k);
        end
        ROC(length(C),2)=Inf;
        
    
    else
        ROC_zero = 1;
          N = length(C)+1;
          ROC = zeros(N,2);
        ROC(1,1)=0;
        for k=1:length(C)
         ROC(k,2)=C(k);
         ROC(k+1,1)=C(k);
        end
        ROC(length(C)+1,2)=Inf;
        
    end
end
