function ret = solution2(hf1, a, b, num_order)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int)
% (ret)float
root_legendre = my_legendre_root(num_order);
%---start from here---
[~,hf_legendre] = my_legendre(num_order); %legendre function
legendre_derivative = (hf_legendre(root_legendre+1e-5) - hf_legendre(root_legendre-1e-5))/2e-5;

weight = 2./((1-root_legendre.^2).*legendre_derivative.^2);

x = root_legendre*(b-a)/2 + (b+a)/2;
ret = (b-a)/2 * sum(weight.*hf1(x));
%---end---
end
