%{
right reserved for [Chang Zhao]
%}

function ret = code_template()
N = 10000;   %number of the terms 
pi_qwq = 1;
i = 1;
while i < N
    pi_qwq = pi_qwq - 2*(1/(4*i-1)/(4*i+1));
    i = i+1;
end
ret = 4*pi_qwq;
fprintf('my_pi = %.15f\n',ret)    
end

%{
--- add your report here ---
N=500,      my_pi = 3.142593654340043
N=1000,     my_pi = 3.142092903683559
N=2000,     my_pi = 3.141842716101517
N=5000,     my_pi = 3.141692663590541
N=10000,    my_pi = 3.141642656089892
%}
