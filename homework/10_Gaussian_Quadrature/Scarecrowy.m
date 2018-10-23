%{
right reserved for [Scarecrowy]
%}

function ret = code_template(hf1, a, b, num_order)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int): order of legendre polynomial
% (ret)float
h = 1e-3;
root_legendre = my_legendre_root(num_order);
[~,hf2] = my_legendre(num_order);

Pn_1 = (hf2(root_legendre+h/2) - hf2(root_legendre-h/2))./h;
Pn_12 = Pn_1.^2;
w_i = 2./((1-root_legendre.^2).*Pn_12);
fxi = hf1(0.5*(b-a)*root_legendre+0.5*(a+b));
ret = sum(w_i.*fxi);
ret = (b-a)/2*ret; 
%---end---
end