%{
right reserved for [YUAN Mengfeix]
%}



%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
% hf1(function handle)
% a(float)
% b(float)
% num_order(int): order of legendre polynomial
% (ret)float
hf1 = @(x) sin(x);
a = 0;
b = pi;

for i = 1:5
    k = i;
    hf2 =  @(x) hf1((b-a)/2*x+(b+a)/2);
    m = my_legendre_root(k);
    n = my_legendre_derivative(k);
    weight = 2./(1-m.^2)./(n.^2);
    I = sum (weight.* hf2( my_legendre_root(k)))*(b-a)/2;
    fprintf ('k = %d, I = %d\n',k, I);
end



function ret = my_legendre_derivative(N)

n = 10000;
h = 2/(n-1);
x1 = my_legendre_root(N);
xx1=polyval(my_legendre(N),x1);
k1=polyval(my_legendre(N),x1-h);
k2=polyval(my_legendre(N),x1-2*h);
l1=polyval(my_legendre(N),x1-h);
l1=polyval(my_legendre(N),x1+h);
k2=polyval(my_legendre(N),x1+2*h);
fk= (k2-8*k1+8*l1-l2)./(12*h);

ret = fk;

end