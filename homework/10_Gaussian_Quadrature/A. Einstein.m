
%{
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

%%%%%%%%%%%%%%
% THIS IS HW10!
%%%%%%%%%%%%%%
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
%ret = 0;
[~,hf2]=my_legendre(num_order); %%  quote Pn(x)
pr=(hf2(root_legendre+0.000001)-hf2(root_legendre-0.000001))/0.000002; %% calculate P'(xi)
w=2./((1-root_legendre.^2).*pr.^2);  %% weight
y=((b-a)/2).*root_legendre + (a+b)/2; %% transfer f(y) to f((b-a)/2*x+(a+b)/2)
quad = (b-a)/2*sum(w.*hf1(y));  %% CALCULATE sum(w.*f((b-a)/2*x+(a+b)/2))
ret = quad;  %% return integral
%---end---
end