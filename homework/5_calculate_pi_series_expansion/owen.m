%{
right reserved for [owen]
%}


function ret = code_template()
% calculate pi using series expansion
% series used: pi/4 = 1 - 2 * (1/3/5 + 1/7/9 + ... )
% request for largest time of iterations for the summation from user
n_iteration = input("Number of iterations = ");  
i = 1; sum = 0;
while i <= n_iteration   % sum of all iterations
  sum += 1/(4*i-1)/(4*i+1);
  i ++;
end
pi_series_expansion = 4*(1-2*(sum));   % pi calculation
fprintf("Pi = %.15f\n", pi_series_expansion)
ret = pi_series_expansion;
end

%{
--- add your report here ---
Number of iterations = 1000
Pi = 3.142092403683529

Number of iterations = 10000
Pi = 3.141642651089886

Number of iterations = 1000000
Pi = 3.141593153589523
%}
