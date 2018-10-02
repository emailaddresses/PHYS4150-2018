%{
right reserved for [W. Yi]
%}



function pi_n = code_template()
% calculate pi use Liu Hui's method
n = 6;
x_n=1; 
while n<10000
    n = n*2;
    pi_n = 0;
    x_n=sqrt(x_n+2);
    pi_n=pi_n+n*sqrt(4-x_n^2)/4;
    fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n) %doc('fprintf')
end
end

%{
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
n, my_pi =      12288,  3.141592515921144
%}
