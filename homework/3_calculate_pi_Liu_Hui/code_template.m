%{
complete infomation in the sqare brackets []

name: [e.g. Albert Einstein; this is for grading]
uid: [e.g. 31415926535]
put on course website: [yes or no]
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
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

% unittest
hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
assert(hfe(my_pi_Liu_Hui(), pi)<1e-3, 'your function result has large error')
disp('unittest passed')


function pi_n = my_pi_Liu_Hui()
% calculate pi use Liu Hui's method
% ---- start from here ---
n = 6;
while n<10000
    n = n*2;
    pi_n = 0;
    fprintf('n, my_pi = %10d,  %.15f\n', n, pi_n) %doc('fprintf')
end
% --- end ---
end

%{
--- paste your print out result here ---

%}

