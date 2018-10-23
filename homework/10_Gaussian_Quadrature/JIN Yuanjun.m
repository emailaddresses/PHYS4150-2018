%{
right reserved for [JIN Yuanjun]
%}
clc ; clear all;
fprintf('      the orders  N,     integrals \n' ) % print head of table
for i = 1:7

N = i; % the order of legendre polynomids; 

hf = @(x) sin(x).*exp(x).*x; % take this function as an example
a = 0; % lower limit;
b = pi ; % upper limnit

hf1 = @(x) hf(0.5*(b - a).*x +0.5 *(a +b));


integral = sum(my_legendre_weight(N).*hf1(my_legendre_root(N)))*(b-a)*0.5;


fprintf('%10d,  %.15f\n', N, integral) %doc('fprintf')
end
%{
      the orders  N,     integrals 
         1,  23.738754365258220
         2,  29.819607705336889
         3,  24.400776536896799
         4,  24.271062751182015
         5,  24.278893700679305
         6,  24.278970033330101
         7,  24.278968659244139
compared with built-in functions in matlabe

x1 =  0:0.01:pi;
y1 = sin(x).*exp(x).*x;
s1 = trapz(x1,y1)
s1 = 

24.2783

%}



function ret = my_legendre_weight(N)
%calculate integral using Gaussian Quadrature method
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature

a = my_legendre_root(N);
b = my_legendre_derivative(N);

wi = 2./((1-a.^2).*b.^2);

%---start from here---
ret = wi;
%---end---
end



function ret = my_legendre_derivative(N)
%this code is used to calculate the first order derivation of the n-th
%order Lenendre polynomial with numberical differentiation method;
%reference: https://en.wikipedia.org/wiki/Gaussian_quadrature
n = 1000;
h = 2/(n-1);
x1 = my_legendre_root(N);
xx1=polyval(my_legendre(N),x1);
k_2=polyval(my_legendre(N),x1-2*h);
k_1=polyval(my_legendre(N),x1-h);
k1=polyval(my_legendre(N),x1+h);
k2=polyval(my_legendre(N),x1+2*h);% define 4 points around the roots of nth Lenendre polymial and calculate the first order derivative at each root
fk= (k_2-8*k_1+8*k1-k2)./(12*h);
%---start from here---
ret = fk;
%---end---
end
