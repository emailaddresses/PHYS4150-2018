function ret = solution()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---
ret = my_MonteCarlo_rule(@(x) sqrt(1-x.^2), -1, 1, 1000)*2;
% --- end ---
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
% one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;
ret = sum(hf1(x))/num_point * (b-a);
end
