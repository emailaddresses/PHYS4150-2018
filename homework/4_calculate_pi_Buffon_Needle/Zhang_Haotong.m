%{
right reserved for [Zhang Haotong]
%}

function pi_n = ZHT_4BuffonNeedle()
% calculate pi use Buffon Needle
n = 6;
while n<1000000
    needleTimes = 0;
    theNumberOfHits = 0;
    while needleTimes < n
     distance = rand(1)/2;
     angular = sin(rand(1) * pi);
     if (distance <= 0.5 * angular)
        theNumberOfHits = theNumberOfHits + 1;
     end
     needleTimes = needleTimes + 1;
    end
    pi_n = 2 * needleTimes / theNumberOfHits;
    n = n*2;
   
    fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n) %doc('fprintf')
end
end

%{
n, my_pi =         12,  3.000000000000000
n, my_pi =         24,  4.000000000000000
n, my_pi =         48,  3.200000000000000
n, my_pi =         96,  3.692307692307693
n, my_pi =        192,  3.310344827586207
n, my_pi =        384,  3.226890756302521
n, my_pi =        768,  2.988326848249027
n, my_pi =       1536,  3.084337349397591
n, my_pi =       3072,  3.183419689119171
n, my_pi =       6144,  3.099899091826438
n, my_pi =      12288,  3.182595182595183
n, my_pi =      24576,  3.151577327519877
n, my_pi =      49152,  3.137294951171252
n, my_pi =      98304,  3.154105303686591
n, my_pi =     196608,  3.142710997442455
n, my_pi =     393216,  3.137244889817932
n, my_pi =     786432,  3.137783133106973
n, my_pi =    1572864,  3.136100172470516
%}
