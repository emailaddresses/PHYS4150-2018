%{
right reserved for [Red Scarf]
%}


%{
n,   pi_n     should take value like this, also depend on the your initial value for n
6,   2.598076
8,   2.828427
12,  3.000000
16,  3.061467
24,  3.105828
32,  3.121445
%}


function x = code_template(N,flag) %N: iternation times
% calculate pi use Liu Hui's method
% ---- start from here ---
start_number=6; % start polygon
n=start_number*2^N;
if N==0
    x=2*cos(2*pi/start_number);
else
    x=sqrt(2+code_template(N-1,flag));
end
pi_n=1.0/4.0*n*sqrt(4-x^2);
fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n) %doc('fprintf')
if N==flag
    x=pi_n;
endif
end

%{
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

