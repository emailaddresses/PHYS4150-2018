%{
right reserved for [JIN Yuanjun]
%}


function pi_n = code_template()
% calculate pi use Liu Hui's method
% ---- start from here ---
n = 3;
fprintf('  \t     n,  my_pi \n')
Sn = sqrt(3);
while n<100
    % S2n^2 = 2 - sqrt(4 - Sn^2)
    n = n*2 ;
    Sn =sqrt( 2 - sqrt(4 - Sn^2));
    pi_n = Sn*n/2 ;
    fprintf('%10d,  %.15f \n', n, pi_n) %doc('fprintf');
end
end

%{
  	     n,  my_pi
         6,  3.000000000000000
        12,  3.105828541230250
        24,  3.132628613281237
        48,  3.139350203046872
        96,  3.141031950890530
       192,  3.141452472285344
%}
