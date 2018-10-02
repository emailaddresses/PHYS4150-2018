%{
right reserved for [Red Scarf]
%}


function ret=code_template()
% calculate pi use Buffon's needle method
% ---- start from here ---
N=1000000;
CN=0;
for i=1:N
    x1=rand(1);y1=rand(1);ang=rand(1)*pi;
    x2=x1+cos(ang);y2=y1+sin(ang);
    if (y2>1)
        CN++;
    end
end

fprintf('%f\n',N/CN*2);
ret=N/CN*2;
% --- end ---
end

%{
1. A weird thing: It seems that we must use pi during this algorithm in advance to get the number of pi...
So maybe this method is actually not a wise way to calculate pi.
2. Of course more needle, more accurate the result, but the converge speed is rather slow... We need to throw
10^6 needles to get the famous number: 3.14...
%}
