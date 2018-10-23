%{
right reserved for [owen]
%}


function ret = code_template()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---
funct_circle = @(x) sqrt(1-x.^2);  %integral a quarter circle
ret = 4 * my_MonteCarlo_rule(funct_circle, 0, 1, 999999);  
% --- end ---
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
% one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;
ret = sum(hf1(x))/num_point * (b-a);
end
