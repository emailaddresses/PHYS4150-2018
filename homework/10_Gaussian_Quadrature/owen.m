%{
right reserved for [owen]
%}

function ret = code_template(hf1, a, b, num_order)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int): order of legendre polynomial
% (ret)float
%---start from here---
root_legendre = sort(my_legendre_root(num_order));
[tmp,Pn] = my_legendre(num_order);
[tmp,Pn_1] = my_legendre(num_order-1);
d1Legendre = num_order.* -1 * Pn_1(root_legendre) ./ (root_legendre.^2 - 1);
weight = 2 ./ (1-root_legendre.^2) ./ d1Legendre.^2;
ret =  (b-a)/2 * sum(weight.*hf1((b-a)*0.5*root_legendre + (b+a)/2));
%---end---
end


