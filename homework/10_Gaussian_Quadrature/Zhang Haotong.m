%{
right reserved for [Zhang Haotong]
%}

function ret = zht_10_Guass(hf1, a, b, num_order)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int): order of legendre polynomial
% (ret)float
%---start from here---
k = 1;
ret = 0;
[weight,hf2] = my_legendre(num_order);
sloves = my_legendre_root(num_order);
while k < num_order
    x = sloves(k);
    q = diff_sub_legendre(x, weight);
    w = 2 / (1 - x^2) / (q)^2;
    ret = ret + w * hf1((b-a)/2*x + (a+b)/2);
    k = k  + 1;
end
ret = ret * (b-a)/2;
%---end---
end

function ret = diff_sub_legendre(x, weight)
ret = 0;
N0 = size(weight,2)-1;
for ind1=N0:-1:0
    ret = ret + ind1 * x.^(ind1-1) * weight(N0+1-ind1);
end
end