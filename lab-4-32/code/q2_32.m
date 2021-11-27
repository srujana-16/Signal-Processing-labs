%% 4.2 a
t_samples = 0:0.0002:1;
f = 10;
xn = sin(2*pi*f*t_samples);
a = 1; 

% % 4.2 b
B = 4;
xqn = quadratic_quant(xn,B,a);
eqn = xn-xqn;
figure(1);
grid on;
subplot(3,1,1);
plot(t_samples,xn);
xlabel('t_samples');
ylabel('sampled signal');
subplot(3,1,2);
plot(t_samples,xqn);
xlabel('t_samples');
ylabel('quantised signal');

% 4.2 c
subplot(3,1,3);
plot(t_samples,eqn);
xlabel('t_samples');
ylabel('quantisation error');

%% 4.2d
% B = 3;
% xqn = quadratic_quant(xn,B,a);
% eqn = xn-xqn;
% figure(5);
% histogram(eqn,15);
% title('Quantisation Error for B = 3');
% 
% B = 4;
% xqn = quadratic_quant(xn,B,a);
% eqn = xn-xqn;
% figure(6);
% histogram(eqn,15);
% title('Quantisation Error for B = 4');

%% 4.2e
% M = zeros(8);
% for B=1:8
% xqn = quadratic_quant(xn,B,a);
% eqn = xn-xqn;
% M(B) = max(abs(eqn));
% end
% figure(2);
% B = 1:8;
% plot(B,M);
% xlabel('B');
% ylabel('Maximum Absolute Quantisaton Error');
% grid on;

%%4.2f

% SQNR = zeros(8);
% noisepower = zeros(8);
% sigpower = 0;
% i = xn;
% Xn = i.*i;
% sigpower = sum(Xn, 'all');
% 
% for B = 1:8
% xqn = quadratic_quant(xn,B,a);
% j = xn-xqn;
% Eqn = j.*j;
% noisepower(B) = sum(Eqn, 'all');
% SQNR(B) = sigpower/noisepower(B);
% end
% 
% figure(3);
% B = 1:8;
% plot(B,SQNR);
% xlabel('B');
% ylabel('Signal to Quantisaton Noise Ratio');
% grid on;

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

%% 4.2d
% As B increases ,ie, from 3 to 4, the quantisation error slightly decreases 
% the histogram is symmetric in case of B =4 but not in case of B = 3

%% 4.2e
% The maximum absolute quantisation error decreases with increasing B (as expected).

%% 4.2f
% SQNR increases with increasing B.

%% 4.2g
% for quadratic quantisation for values closer to a and -a , the error is maximum and almost zero in the middle.
% for linear quantisation, as we go from -a to a the error decreases.
