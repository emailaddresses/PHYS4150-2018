
%{
right reserved for [W. Yi]
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
sum=0;
for i=1:num_order
    [~,pn]=my_legendre(num_order);
    [~,pn_]=my_legendre(num_order-1);
    x=root_legendre(i);
    pnd=num_order*(x*pn(x)-pn_(x))/(x^2-1);
    weighti=2/(pnd^2*(1-x^2));
    sum=sum+weighti*hf1((b-a)*x/2+(b+a)/2);
end
ret=(b-a)*sum/2;

%---end---
end
