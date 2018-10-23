%{
right reserved for [Red Scarf]
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
sum=0;
for i=1:num_order
  [~,Pn]=my_legendre(num_order);
  [~,Pnn]=my_legendre(num_order-1);
  xi=root_legendre(i,1);
  DPn=num_order/(xi^2-1)*(xi*Pn(xi)-Pnn(xi));
  wi=2/((1-xi^2)*DPn^2);
  sum+=wi*hf1((b-a)/2*xi+(b+a)/2);
endfor
ret = (b-a)/2*sum;
%---end---
endfunction

