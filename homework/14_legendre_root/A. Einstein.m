%{
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}

%%%%%%%%%%%%%%%%%
% THIS IS HW14! %
%%%%%%%%%%%%%%%%%


function ret = code_template(N)
% find N roots of N-th order legendre polynomial
% (ret)(1,N)

if N==0
    ret = zeros(1,0);
    return;
end

[~, hf_legendre] = my_legendre(N);
hf_legendre_gradient = @(x) (hf_legendre(x+1e-5) - hf_legendre(x-1e-5))/2e-5;
% ---start coding from here---
Trace = zeros(1,N);
x0=-1;

for i=1:N
    tmp=0.005;       %%% step length
  while hf_legendre(x0)*hf_legendre(x0+tmp)>=0 %%%%%% find a range including  only one root and garentee the upper limit converge to root 
      tmp=tmp+0.005;
  end
    [R,~]= my_newton_raphson(hf_legendre,hf_legendre_gradient,x0+tmp,50); %%%%%%% find root
    Trace(i)=R;
    x0 = x0+tmp;
end

ret = Trace;    %%%%%%return roots
% ---end coding---
end