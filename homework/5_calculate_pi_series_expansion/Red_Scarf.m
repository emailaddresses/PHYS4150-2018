%{
right reserved for [Red Scarf]
%}


function code_template()
N=100000;
summation=0;
for i=0:N
    summation+=(-1)^i/(2*i+1);
end

fprintf('%f\n',summation*4);
end
