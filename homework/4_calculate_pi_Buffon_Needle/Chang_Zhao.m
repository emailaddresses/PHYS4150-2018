%{
right reserved for [Chang Zhao]
%}


function ret = code_template()
% calculate pi use Buffon's needle method
% ---- start from here ---
ret = 0;
M = 100000;
N = 0;
num = 1;
x = rand(1,M)*0.5;
y = rand(1,M);
while num <M
    if x(num) <= 0.5*sin(y(num)*pi)
        N = N+1;
    end
    num = num+1;
end
ret = 2*M/N;
% --- end ---
end

%{
--- add your report here ---
N = 100,   ret = 2.8986
N = 1000,  ret = 3.0960
N = 10000 ,ret = 3.1397
N = 100000,ret = 3.1557
Generally speaking, the accuracy of this method will increase as we
increase the number of drops. because this Monte Carlo method depends on
repeater random sampling, if we add the drops, the frequency of M/N will
become closer to the probablity, which is the object area divided by total
area.

To make the Puffon Needle method more accurate, first we could increase the
number of total drop(N), second it's important for us to choose effective
random number generator.
%}
