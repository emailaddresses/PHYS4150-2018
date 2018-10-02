%{
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}


function pi_n = code_template02()
% calculate pi use Liu Hui's method
x = 1;
n = 6;
while n<100000
    n = n*2;
    x = sqrt(2 - sqrt(4- x*x));
    y = 1;
    %y = sqrt(1-x*x/4)
    pi_n = n*x*y/2;
    fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n) %doc('fprintf')
end
end

%{
--- paste your print out result here ---

n, my_pi =         12,  3.105828541230250
n, my_pi =         24,  3.132628613281237
n, my_pi =         48,  3.139350203046872
n, my_pi =         96,  3.141031950890530
n, my_pi =        192,  3.141452472285344
n, my_pi =        384,  3.141557607911622
n, my_pi =        768,  3.141583892148936
n, my_pi =       1536,  3.141590463236762
n, my_pi =       3072,  3.141592106043048
n, my_pi =       6144,  3.141592516588155
n, my_pi =      12288,  3.141592618640789
n, my_pi =      24576,  3.141592645321216
n, my_pi =      49152,  3.141592645321216
n, my_pi =      98304,  3.141592645321216
n, my_pi =     196608,  3.141592645321216
%}
