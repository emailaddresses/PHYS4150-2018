%{
right reserved for [W.Yi]
%}


function ret = code_template()
% calculate pi use Buffon's needle method
ret = 0;
s=0;
i=0;
while i<10000000
    t=rand(1,1);
    theta=pi*rand(1,1)/2;
    if t<=cos(theta)/2 
        s=s+1;
    end
    i=i+1;
end
ret=10000000/s;
end

%{
number needle thrown: 1000  relative error: 0.026289
number needle thrown: 10000  relative error: 0.0070025
number needle thrown: 100000  relative error: 0.0020846
number needle thrown: 1000000  relative error: 0.00040519
number needle thrown: 10000000  relative error:  0.00014119
Thus, increasing the number needle thrown can effectively improve the
accuracy.
%}
