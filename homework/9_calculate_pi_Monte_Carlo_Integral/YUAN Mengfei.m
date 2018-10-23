%{
right reserved for [YUAN Mengfei]
%}



function ret = code_template()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---
ret = my_MonteCarlo_rule(@(x) sqrt(2-power(x,2)),-sqrt(2),sqrt(2),1000);
% --- end ---
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
% one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;
ret = sum(hf1(x))/num_point * (b-a);
end