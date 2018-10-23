%{
right reserved for [Zhou Wenhan]
%}
function ret = gaussianquadrature(hf1, a, b, num_order)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int): order of legendre polynomial
% (ret)float
root_legendre = my_legendre_root(num_order);
%---start from here---
[~,hf2]=my_legendre(num_order);
[~,hf3]=my_legendre(num_order-1);
my_legendre_first_derivative=@(x) num_order*(x.*hf2(x)-hf3(x))./(x.^2-1);
w=2./(1-root_legendre.^2)./(my_legendre_first_derivative(root_legendre)).^2;
x1=root_legendre*(b-a)/2+(b+a)/2;
ret = (b-a)*sum(w.*hf1(x1))/2;
%---end---
end


