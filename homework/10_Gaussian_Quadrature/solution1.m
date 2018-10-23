function ret = solution1(hf1, a, b, num_order)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int)
% (ret)float
root_legendre = my_legendre_root(num_order);
%---start from here---
hf2 = my_legendre_first_derivative(num_order); %function handle
weight = 2./((1-root_legendre.^2).*hf2(root_legendre).^2);

x = root_legendre*(b-a)/2 + (b+a)/2;
ret = (b-a)/2 * sum(weight.*hf1(x));
%---end---
end

function ret = my_legendre_first_derivative(N)
% reference: https://en.wikipedia.org/wiki/Legendre_polynomials#Recursion_relations
% N(int)
% (ret)(function handle)
if N==0
    ret = @(x) zeros(size(x));
else
    [~,hf1] = my_legendre(N);
    [~,hf2] = my_legendre(N-1);
    ret = @(x) N*(x.*hf1(x) - hf2(x))./(x.^2-1);
end
end
