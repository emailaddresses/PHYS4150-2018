%{
right reserved for [Zhang Haotong]
%}


function pi_n = ZHT_5calculatepiseriesexpansion()
% calculate pi use series expansion 
% ---- start from here ---
n = 0;
poly = 0;
while n<100000
    a = (-1)^n / ( 2 * n + 1);
    poly = poly + a;
    pi_n = 4 * poly;
    if mod(n,10000) == 0
     fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n) %doc('fprintf')
    end
    n = n + 1;
end
end

%{
n, my_pi =          0,  4.000000000000000
n, my_pi =      10000,  3.141692643590535
n, my_pi =      20000,  3.141642651089887
n, my_pi =      30000,  3.141625985812036
n, my_pi =      40000,  3.141617652964806
n, my_pi =      50000,  3.141612653189785
n, my_pi =      60000,  3.141609319978660
n, my_pi =      70000,  3.141606939099973
n, my_pi =      80000,  3.141605153433501
n, my_pi =      90000,  3.141603764577390
%}
