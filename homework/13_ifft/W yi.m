%{
right reserved for [W yi]
%}

function ret = code_template(x)
% implement inverse fast fourier transform
% reference
%   DFT-wiki: https://en.wikipedia.org/wiki/Discrete_Fourier_transform
%   Cooley-Tukey FFT-wiki: https://en.wikipedia.org/wiki/Fast_Fourier_transform
% x(1*N1)
% ret(1*N1)
N1 = size(x,2);
ret=zeros(1,N1);
Fe=zeros(1,N1);
Fo=zeros(1,N1);
for k=1:N1/2
  for m=1:(N1/2)
    Fe(1,k)= Fe(1,k)+exp(2*pi*1i*(m-1)*(k-1)/N1*2)*x(1,2*m-1)/N1;
    Fo(1,k)= Fo(1,k)+exp(2*pi*1i*(m-1)*(k-1)/N1*2)*x(1,2*m)/N1;
  end
  ret(1,k)=Fe(1,k)+exp(2*pi*1i*(k-1)/N1)*Fo(1,k);
  ret(1,k+N1/2)=Fe(1,k)-exp(2*pi*1i*(k-1)/N1)*Fo(1,k);
end
end
%unittest report relative error: 0



% need  not
