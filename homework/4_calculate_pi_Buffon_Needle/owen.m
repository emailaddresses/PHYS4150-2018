%{
right reserved for [owen]
%}


function ret = code_template()
% calculate pi use Buffon's needle method
n_steps = 0; N = 0; M = 0;
total_drops = 100000;
  while N < total_drops
      location = rand/2; angle = rand;
      if location <= 0.5 * sin(angle * pi)
        M++;
      end
      N++;
  end
ret = 2*N/M;
fprintf("Total drops, pi = %10d,  %.15f\n", N, ret);
end

%{
--- add your report here ---
Total drops, pi =       1000,  3.154574132492113
relative error: 0.0020615

Total drops, pi =      10000,  3.135779241141424
relative error: 0.00092594

Total drops, pi =     100000,  3.140111787979652
relative error: 0.00023571

Total drops, pi =    1000000,  3.143151701073700
relative error: 0.00024803
%}
