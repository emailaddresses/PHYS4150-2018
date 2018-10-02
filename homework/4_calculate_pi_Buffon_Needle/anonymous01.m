%{
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}


function ret = code_template03()
% calculate pi use Buffon's needle method
ret = 0;
N=10000;
d = rand(1,N)/2;
sita = rand(1,N);
n = 0;
for i=1:N
    if d(i)<abs(sin(300000000*sita(i)))/2
        n = n+1;
        fprintf('n, my_pi = %10d,  %.15f\n', n, 2*N/n)
    end
    
end
pi = 2*N/n;

M = 10000*N;
d1 = rand(1,M)/2;
gamma = rand(1,M);
n = 0;
for i=1:M
    if d1(i)<abs(sin(300000000*pi*gamma(i)))/2
        n = n+1;
    end
end

fprintf('n, my_pi = %10d,  %.15f\n', n, 2*M/n)
end

%{
--- add your report here ---
n, my_pi =   63663814,  3.141502015571986
%}
