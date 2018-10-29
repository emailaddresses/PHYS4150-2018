%{
right reserved for [Richang HUANG]
%}

function ret = code_template(N)
% find N roots of N-th order legendre polynomial
% (ret)(1,N)
if N==0
    ret = zeros(1,0);
    return;
end

[~, hf_legendre] = my_legendre(N);
Pn = @(x) hf_legendre(x);
%hf_legendre_gradient = @(x) (hf_legendre(x+1e-5) - hf_legendre(x-1e-5))/2e-5;
% ---start coding from here---
roots = zeros(1,N);
root_num = 1;
 if rem(N,2)==1
        roots(1,1) = 0;
        root_num = root_num + 1 ;
 end

while root_num < N+1

     a = 2*rand()-1 ;
     b = 2*rand()-1 ;
     while Pn(a)*Pn(b)>0
         a = 2*rand()-1;
     end
     tem = my_bisection(Pn,a,b,100);

        if ~any(round(roots,4)==round(tem,4))
            roots(1,root_num) = tem;
            root_num = root_num+1;
        end   

    
end


roots = sort(roots);

ret = roots;


% ---end coding---



end

