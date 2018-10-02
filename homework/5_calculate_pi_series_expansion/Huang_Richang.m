%{
right reserved for [Huang Richang]
%}

function ret = code_template()
N = 0;
summation = 0;
while N<100000
    N = N+2;
    summation = summation + 1/((2*N-1)*(2*N+1));
end
result = 4-8*summation;
ret = result ;
end
