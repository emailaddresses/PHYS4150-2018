%{
right reserved for [Red Scarf]
%}


function ret = code_template()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---
ret = my_MonteCarlo_rule(@(x) 1./(1+x.*x),0,1,10000000);
% --- end ---
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
% one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;
ret = 4*sum(hf1(x))/num_point * (b-a);
end

