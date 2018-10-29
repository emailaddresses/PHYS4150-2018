%{
right reserved for [Red Scarf]
%}

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
ret = zeros(1,N);
if mod(N,2)==1
  step=10^(-3);point=step;
  i=(N+3)/2;
  while i<=N
    if hf_legendre(point)*hf_legendre(point+step)<0
      steps=5;x0=point;
      tracks = zeros(1,steps);
      tracks(1) = x0;
      for ind1 = 2:steps
        x0 = x0 - hf_legendre(x0)/hf_legendre_gradient(x0);
        tracks(ind1) = x0;
      endfor
      ret(1,i) = tracks(end);
      ret(1,N-i+1)=-tracks(end);
      i++;
    endif
    point+=step;
  endwhile
else
  step=10^(-3);point=step;
  i=N/2+1;
  while i<=N
    if hf_legendre(point)*hf_legendre(point+step)<0
      steps=5;x0=point;
      tracks = zeros(1,steps);
      tracks(1) = x0;
      for ind1 = 2:steps
        x0 = x0 - hf_legendre(x0)/hf_legendre_gradient(x0);
        tracks(ind1) = x0;
      endfor
      ret(1,i) = tracks(end);
      ret(1,N-i+1)=-tracks(end);
      i++;
    endif
    point+=step;
  endwhile
endif
% ---end coding---
end