function y = quadratic_quant(x,B,a)
 y = zeros(size(x));
 n = 5001;
 L = 1/2^(B-1);

 for k= 1:n
    if(x(k)>0)
        if(x(k)>a)
             y(k) = (level(2^(B-1)) + level(2^(B-1)- 1))/2;
        end  
        
         t = 0:L:1;
         level = a*t.^2;
 
          for p = 1: 2^(B-1) 
       if(x(k)>=level(p) && x(k)<level(p+1))
           break;
       end
    
    end
       y(k) = (level(p) + level(p+1))/2;
   

    else  
        if(x(k)<-a)
        y(k) = (level(2^(B-1)) + level(2^(B-1)- 1))/2;
        end
        
    t = -1:L:0;
    level = (-a)*t.^2;
 
    for v = 1: 2^(B-1) 
       if(x(k)>=level(v) && x(k)<level(v+1))
         break;
       end
    end
 
           y(k) = (level(v) + level(v+1))/2;
  
    end

end
end
