%{
right reserved for [Huang Richang]
%}

function pi_n = code_template()
% calculate pi use Liu Hui's method
n = 6;
L_n = 1;
h_n = sqrt(1-(L_n^2)/4);
pi_n = 0.5*n*L_n*h_n;
fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n)
while n<10000
    n = n*2;
    L_n = sqrt(2-sqrt(4-L_n^2));
    h_n = sqrt(1-(L_n^2)/4);
    pi_n = 0.5*n*L_n*h_n;
    fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n)
end
end

%{
--- paste your print out result here ---
n, my_pi =          6,  2.598076211353316
n, my_pi =         12,  3.000000000000001
n, my_pi =         24,  3.105828541230248
n, my_pi =         48,  3.132628613281243
n, my_pi =         96,  3.139350203046888
n, my_pi =        192,  3.141031950890392
n, my_pi =        384,  3.141452472285227
n, my_pi =        768,  3.141557607912475
n, my_pi =       1536,  3.141583892157030
n, my_pi =       3072,  3.141590463271827
n, my_pi =       6144,  3.141592105895269
n, my_pi =      12288,  3.141592515967563
%}
