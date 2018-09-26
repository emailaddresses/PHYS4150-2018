
%{
complete infomation in the sqare brackets []

name: [e.g. Albert Einstein; this is for grading]
uid: [e.g. 31415926535]
put on course website: [yes or no]
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

function ret = code_template(hf1, a, b, num_order)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int): order of legendre polynomial
% (ret)float
root_legendre = my_legendre_root(num_order);
%---start from here---
ret = 0;
%---end---
end
