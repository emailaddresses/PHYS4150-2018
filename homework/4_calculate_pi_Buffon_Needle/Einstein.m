%{
right reserved for [Einstein]
%}


function ret =needle_calculate_pi(n)
% calculate pi use Buffon's needle method
x=0.5.*rand(1,n);y=rand(1,n);m=0;
for a=1:n
    if x(a)<=0.5*sin(pi*y(a))
        m=m+1;
    end
end
ret=2*n/m;
end

%{
--- add your report here ---
needle_calculate_pi(500)
ans =  3.1056

needle_calculate_pi(5000)
ans = 3.1260

needle_calculate_pi(50000)
ans = 3.1437
%}
