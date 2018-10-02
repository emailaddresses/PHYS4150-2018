%{
right reserved for [YUAN Mengfei]
%}

function pi_n = code_template()
% calculate pi use Liu Hui's method
n = 6;
l_n = 1; 
while n<10000
    n = n*2;
    l_n = sqrt ( 2- sqrt (4 - l_n^2)) ;
    pi_n = l_n * n/2;
    fprintf('n, my_pi = %10d,  %.15f,\n', n, pi_n) %doc('fprintf')
end
end

%{
n, my_pi =         12,  3.105828541230250,
n, my_pi =         24,  3.132628613281237,
n, my_pi =         48,  3.139350203046872,
n, my_pi =         96,  3.141031950890530,
n, my_pi =        192,  3.141452472285344,
n, my_pi =        384,  3.141557607911622,
n, my_pi =        768,  3.141583892148936,
n, my_pi =       1536,  3.141590463236762,
n, my_pi =       3072,  3.141592106043048,
n, my_pi =       6144,  3.141592516588155,
n, my_pi =      12288,  3.141592618640789,
ans =
    3.1416
%}
