%{
right reserved for [owen]
%}

function ret = code_template(x)
% implement inverse fast fourier transform
% reference
%   DFT-wiki: https://en.wikipedia.org/wiki/Discrete_Fourier_transform
%   Cooley-Tukey FFT-wiki: https://en.wikipedia.org/wiki/Fast_Fourier_transform
% x(1*N1)
% ret(1*N1)
N1 = size(x,2);
%ret = conj(my_fft(conj(x)))/N1;      #Alternative way: simpler fft and ifft relationship 
ret = 1/N1*my_ifft(x);
end

function ret = my_ifft(x)
% hint: maybe need or not
N1 = size(x,2);
if mod(N1,2)~=0, error('radix-2 required'); end
if N1==2
    ret = [x(1)+x(2),x(1)-x(2)];
else
    tmp1 = my_ifft(x(1:2:end));
    tmp2 = my_ifft(x(2:2:end));
    tmp3 = tmp2.*exp(1*2*i*pi*(0:(N1/2-1))/N1);
    ret = [tmp1+tmp3, tmp1-tmp3];
end
end


