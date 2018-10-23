%{
right reserved for [Huang Richang]
%}


function ret = code_template()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---
hf1 = @(x) 2*(1-x.^2).^(1/2);
a = -1;
b = 1;
num_point = 10000 ;

ret = my_MonteCarlo_rule(hf1,a,b,num_point);
% --- end ---
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
% one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;
ret = sum(hf1(x))/num_point * (b-a);
end

% unittest
hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
disp(['relative error: ', num2str(hfe(code_template(), pi), 5)])