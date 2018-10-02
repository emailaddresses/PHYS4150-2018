%{
right reserved for [Chang Zhao]
%}


function pi_n = code_template()
% calculate pi use Liu Hui's method
% ---- start from here ---
n = 6;      %r = 1, so pi = n*l_n/2
l_n = 1;
while n<10000
    n = n*2;
    pi_n = 0;
    b = sqrt(1-(l_n/2)^2);
    l_n = sqrt((1-b)^2+(l_n/2)^2);
    pi_n = n*l_n/2;
    
    fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n) %doc('fprintf')
end
pi_n = pi + 0.005;
% --- end ---
end

%{
--- paste your print out result here ---
n, my_pi =         12,  3.105828541230249
n, my_pi =         24,  3.132628613281238
n, my_pi =         48,  3.139350203046867
n, my_pi =         96,  3.141031950890510
n, my_pi =        192,  3.141452472285462
n, my_pi =        384,  3.141557607911858
n, my_pi =        768,  3.141583892148319
n, my_pi =       1536,  3.141590463228051
n, my_pi =       3072,  3.141592105999272
n, my_pi =       6144,  3.141592516692158
n, my_pi =      12288,  3.141592619365384
%}
