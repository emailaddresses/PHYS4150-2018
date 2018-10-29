%{
right reserved for [YUAN Mengfeix]
%}

function ret = code_template(x)
% implement inverse fast fourier transform
% reference
%   DFT-wiki: https://en.wikipedia.org/wiki/Discrete_Fourier_transform
%   Cooley-Tukey FFT-wiki: https://en.wikipedia.org/wiki/Fast_Fourier_transform
% x(1*N1)
% ret(1*N1)
N = size(x,2);
if mod(N,2)~=0, error('radix-2 required'); 
end
if N==2
    ret = [x(1)+x(2),x(1)-x(2)]/N;
else
   
      
      
      for k = 1:N/2
          for m = 1:N/2
             E(k) = sum(x(2*m-1)*exp(2i*pi*(k-1)*2*(m-1)/N))/N;
             O(k) = sum(x(2*m)*exp(2i*pi*(k-1)*2*(m-1)/N))/N;
          end
      end
        
      
     tmp = O(k)*exp(-2i*pi*(0:(N/2-1))/N);
     ret = [E(k)+tmp, O(k)-tmp];
end
end
