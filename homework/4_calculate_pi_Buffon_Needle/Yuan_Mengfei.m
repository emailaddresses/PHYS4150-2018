%{
right reserved for [Yuan Mengfei]
%}

function pi_n = code_template()
% calculate pi use Buffon's Needle method
N = 1000;
while N < 100000
    M = 0 ;
    x = 0.5* rand(1,N);
    y = 180* rand (1,N);
    for i = 1:N
        if x(i) < 0.5* sind (y(i))
            M = M+1;
        end
    end
    fprintf('N, my_pi = %10d,  %.15f\n', N, 2*N/M) %doc('fprintf')
    N = N*2;
end
end

%{
N, my_pi =       1000,  3.095975232198143
N, my_pi =       2000,  3.182179793158313
N, my_pi =       4000,  3.133568350959656
N, my_pi =       8000,  3.142183817753339
N, my_pi =      16000,  3.153952296471516
N, my_pi =      32000,  3.153175346110263
N, my_pi =      64000,  3.143264083296498
%}
