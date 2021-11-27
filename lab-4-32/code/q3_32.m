% loading the audio file 
[xn,Fs] = audioread('/MATLAB Drive/New Folder/file_example_WAV_10MG.wav');
% sound(xn,Fs); % original

a = 1; 
B = 3;
xqn = quadratic_quant(xn,B,a);
sound(xqn,Fs); % quantised

% for B = 1:8
% xqn = quadratic_quant(xn,B,a);
% sound(xqn,Fs);
% pause(2);
% end

function y = quadratic_quant(x,B,a)
 y = zeros(size(x));
 n = size(x);
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

% The quantised signal has much more disturbance and lesser audio quality
% As the levels increases, the disturbance gradually decreases and the
% quality of the signal increases. 
% frequency content of the quantised signal is less than that of the input signal.
% frequency content of the quantised signal increases as B increases.
