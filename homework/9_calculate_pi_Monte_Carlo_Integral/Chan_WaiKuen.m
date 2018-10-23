%{
right reserved for [Chan Wai Kuen]
%}


function ret = code_template()
% calculate pi using Monte Carlo integration
% ---- start from here (almost two lines) ---

% function handle
hf = @(input) new(input);

ret = 2*my_MonteCarlo_rule( hf, -1 , 1 , 10000);
% --- end ---
end

function ret = my_MonteCarlo_rule(hf1, a, b, num_point)
% one dimensional Monte Carlo Integration
x = rand([1,num_point])*(b-a) + a;
ret = sum( hf1(x) )  /num_point * (b-a);
end

% define a new function here
function ret = new(x)
% calculate area of half circle, y = (1-x^2)^(1/2)
ret =  ( 1-(x^2) )^(1/2);
end
