%{
right reserved for [JIN Yuanjun]
%}
%hf1 = @(x) sin(x)*exp(x);
clc; clear all;
fprintf('      intervals k,  erros,    integrals \n' ) % print head of table
a = 0; %lower limit
b = pi;% upper limit
num_point =2; % initial intervals 
con = 0.01; % the convergence criteria;
S1 = 0; % initial S1
hf1 = @(x) sin(x).*exp(x).*x; % take this function as an example
for i = 1:100 % the maximum cyclic steps
N = linspace(a,b,num_point);
N(end)= [];
dx = (b-a)/(num_point -1);
dx1 = dx/2;
ret = 0;
for i = N + dx1;
    ret =ret + hf1(i)*dx;
end
S2 = ret;
num_point =2* num_point;
con1 =abs( S2 -S1);

if con1< con
    break
end
fprintf('%10d, %10d, %.15f\n', num_point, con1, S2) %doc('fprintf')

S1 =S2;
end


%{
results:

      intervals k,  erros,    integrals 
         4, 2.373875e+01, 23.738754365258220
         8, 3.427862e+00, 27.166616447943326
        16, 2.291907e+00, 24.874709837327067
        32, 4.635490e-01, 24.411160818002632
        64, 1.011200e-01, 24.310040835813012
       128, 2.354194e-02, 24.286498893893974+

compared with built-in functions in matlab

x1 =  0:0.01:pi;
y1 = sin(x).*exp(x).*x;
s1 = trapz(x1,y1)

24.2783

%}
