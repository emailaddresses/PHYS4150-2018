%{
right reserved for [Huang Richang]
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
gaussian_quadrature = 0 ;
%---start from here---


[~,hfp1] = my_legendre(num_order);
Pn = @(x) hfp1(x);
[~,hfp2] = my_legendre(num_order-1);
Pm = @(x) hfp2(x);%m = n-1

for i=1:num_order

P_first_derivertiy = num_order/((root_legendre(i)^2)-1)*(root_legendre(i)*Pn(root_legendre(i))-Pm(root_legendre(i)));
w_i = 2/(1-(root_legendre(i)^2))/P_first_derivertiy^2;
gaussian_quadrature = gaussian_quadrature+(b-a)/2*w_i*hf1(root_legendre(i));


ret = gaussian_quadrature;
%---end---
end

%result of unittest:
%relative error compare with built-in: 0.86548
%relative error compare with built-in: 0.50841
%relative error compare with built-in: 0.98781
%relative error compare with built-in: 0.73282
%relative error compare with built-in: 0.19404