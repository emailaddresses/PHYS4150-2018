%{
right reserved for [A. Einstein]
%}

function pi_n =calculate_pi()
% calculate pi use Liu Hui's method
n = 6;
x_n=1;
pi_n = n*sqrt(4-x_n*x_n)/4;
while n<10000
    fprintf('n, my_pi = %10d,  %.15f\n',n,pi_n) %doc('fprintf')
    x_n=sqrt(2+x_n);
    n = n*2;
    pi_n = n*sqrt(4-x_n*x_n)/4;    
end
end

%{
--- paste your print out result here ---
n, my_pi =          6,  2.598076211353316
n, my_pi =         12,  3.000000000000001
n, my_pi =         24,  3.105828541230247
n, my_pi =         48,  3.132628613281242
n, my_pi =         96,  3.139350203046893
n, my_pi =        192,  3.141031950890367
n, my_pi =        384,  3.141452472285344
n, my_pi =        768,  3.141557607912925
n, my_pi =       1536,  3.141583892159359
n, my_pi =       3072,  3.141590463278451
n, my_pi =       6144,  3.141592105876295
%}
