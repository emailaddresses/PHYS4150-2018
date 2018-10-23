%{
right reserved for [JIN Yuanjun]
%}
%hf1 = @(x) sin(x)*exp(x);

% rectangular rule
clc; clear all
a = -1 ; b = 1; num_point = 1000;
fprintf('      k,       erros,    pi_values \n' ) % print head of table
con = 0.001; % the convergence criteria;
hs1 = @(x) sqrt(1-x.^2);% function of half-circle with radius 1
for i = 1:100
x1 = rand(1,num_point)*2-1;
y1 = hs1(x1);
area1 = sum(sum(y1))*(b-a)./num_point;
value_pi1 = area1*2;

x2 = rand(1,2*num_point)*2-1;
y2 = hs1(x2);
area2 = sum(sum(y2))*(b-a)./(2*num_point);
value_pi2 = area2*2;

%con = value_pi2 -value_pi1;

con1 = abs(value_pi2 -value_pi1);
if con1 < con
    break
end
fprintf('%10d,   %10d,  %.15f\n', num_point, con1,  value_pi2) %doc('fprintf')
num_point = 2*num_point;
end

%{
results:
       k,       erros,    pi_values 
      1000,   7.720095e-02,  3.160808896623081
      2000,   1.150887e-02,  3.115675516994313
      4000,   8.161714e-03,  3.138781876215141
      8000,   1.932857e-02,  3.142289852471935
     16000,   1.001524e-03,  3.136270373976698
     32000,   1.235637e-03,  3.138948727226433
     64000,   2.044138e-03,  3.145296844816174
    128000,   7.964897e-03,  3.139885511951536
    256000,   1.782165e-03,  3.141506987640312
    512000,   1.729721e-03,  3.142290297831727

compared with built-in functions in matlabe

x1 =  0:0.01:pi;
y1 = sin(x).*exp(x).*x;
s1 = trapz(x1,y1)
s1 = 

24.2783



%}


