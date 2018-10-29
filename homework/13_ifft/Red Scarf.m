%{
right reserved for [Red Scarf]
%}

function ret = code_template(x)
% implement inverse fast fourier transform
% reference
%   DFT-wiki: https://en.wikipedia.org/wiki/Discrete_Fourier_transform
%   Cooley-Tukey FFT-wiki: https://en.wikipedia.org/wiki/Fast_Fourier_transform
% x(1*N1)
% ret(1*N1)
N1 = size(x,2);
ret=zeros(1,N1);E=zeros(1,N1);O=zeros(1,N1);
for k=1:N1/2
  for m=1:(N1/2)
    E(1,k)+=e^(2*pi*i*(m-1)*(k-1)/N1*2)*x(1,2*m-1)/N1;
    O(1,k)+=e^(2*pi*i*(m-1)*(k-1)/N1*2)*x(1,2*m)/N1;
  endfor
  ret(1,k)=E(1,k)+e^(2*pi*i*(k-1)/N1)*O(1,k);
  ret(1,k+N1/2)=E(1,k)-e^(2*pi*i*(k-1)/N1)*O(1,k);
endfor

end

