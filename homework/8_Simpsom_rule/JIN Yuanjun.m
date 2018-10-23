%{
right reserved for [JIN Yuanjun]
this code is used to calculate the integral of aimed functions based on
Simpsom's rule. If the new result S2 differs from the previous iteration S1 by an
amount less than con, the precision of the calculated value, we shall
assume that the calculation have converged.
%}

clc ; clear all;  
fprintf('         k,     erros,            integrals \n' ) % print head of table
hf1 = @(x) sin(x).*exp(x).*x; % take this function as an example
%hf1 = @(x) sin(x)*exp(x);
a = 0;% lower limit
b = pi; % upper limit
num_point = 2;% the initial number of points should be even
N = linspace(a,b,num_point);
con = 0.01; % the convergence criteria;
h = (b -a )/(num_point -1);
for ii = 1:1000 % the maximum cycling steps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%simpson rule begin%%%%%%%%%%%%%%%%%%%

xo = N(2:2:end-2); % the odd terms
xe = N(3:2:end-1); % the even terms
xd = hf1(N(1)) + hf1(N(end));% the sum of the two end points;
S1 = (h/3)*(xd + 4*sum(hf1(xo)) + 2*sum(hf1(xe)));

xe1 = sum(hf1(xe) + hf1(xo)); % take the sum of  even and odd terms as the even terms for the next sunbintervals
n1 = N + h/2;
n1(end)=[];
n = n1;
S2 = (h/6)*( xd + 2*xe1 + 4*sum(hf1(n)));

con1 = abs(S2 -S1);
if con1 < con
    break
end
num_point = 2* num_point;
h = (b -a )/(num_point -1);
N = linspace(a,b,num_point);
fprintf('%10d,     %10d,     %.15f\n', num_point, con1,  S2) %doc('fprintf')
end



%{
results:

         k,     erros,            integrals 
         4,     1.582584e+01,     15.825836243505483
         8,     1.026336e+01,     24.154579544310682
        16,     2.340128e+00,     24.274856383790585
        32,     5.267814e-01,     24.278774508468739
        64,     1.241803e-01,     24.278958037754531
       128,     3.011455e-02,     24.278968047456949



compared with built-in functions in matlabe

x1 =  0:0.01:pi;
y1 = sin(x).*exp(x).*x;
s1 = trapz(x1,y1)
s1 = 

24.2783

%}


