%{
right reserved for [Zhang Haotong]
%}


function ret = ZHT_9_calculatepiMonteCarloIntegral()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---
hf1 = @(x) 4 ./ (1 + x.^2);
ret = my_MonteCarlo_rule(hf1, 0, 1, 5000);
% --- end ---
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
% one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;
ret = sum(hf1(x))/num_point * (b-a);
end