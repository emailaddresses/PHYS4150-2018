%{
complete infomation in the sqare brackets []

name: [e.g. Albert Einstein; this is for grading]
uid: [e.g. 31415926535]
put on course website: [yes or no]
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

function ret = code_template(x)
% implement inverse fast fourier transform
% reference
%   DFT-wiki: https://en.wikipedia.org/wiki/Discrete_Fourier_transform
%   Cooley-Tukey FFT-wiki: https://en.wikipedia.org/wiki/Fast_Fourier_transform
% x(1*N1)
% ret(1*N1)
N1 = size(x,2);
ret = sub_function(x);
end

function x = sub_function(x)
% hint: maybe need or not
end
