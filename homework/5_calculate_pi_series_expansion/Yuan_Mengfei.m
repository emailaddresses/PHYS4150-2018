%{
right reserved for [Yuan Mengfei]
%}

function pi_n = code_template()
% calculate pi use Series expansion method
N = 100;
while N < 10000
  M = 0 ; 
  for i = 0:N
     M = M + (-1)^i/( 2*i + 1);
  end
  fprintf('N, my_pi = %10d,  %.15f\n', N, 4*M) %doc('fprintf')
  N = N*2;
end

%{
N, my_pi =        100,  3.151493401070991
N, my_pi =        200,  3.146567747182956
N, my_pi =        400,  3.144086415298761
N, my_pi =        800,  3.142841092554028
N, my_pi =       1600,  3.142217263147860
N, my_pi =       3200,  3.141905055956430
N, my_pi =       6400,  3.141748879178585
N, my_pi =      64000,  3.143264083296498
%}
