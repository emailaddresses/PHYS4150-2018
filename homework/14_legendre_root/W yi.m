%{
right reserved for [W yi]
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
  stp=10^(-3);
  pt=stp;
  i=(N+3)/2;
  while i<=N
    if hf_legendre(pt)*hf_legendre(pt+stp)<0
      stps=5;
      x0=pt;
      tracks = zeros(1,stps);
      tracks(1) = x0;
      for ind1 = 2:stps
        x0 = x0 - hf_legendre(x0)/hf_legendre_gradient(x0);
        tracks(ind1) = x0;
      end
      ret(1,i) = tracks(end);
      ret(1,N-i+1)=-tracks(end);
      i=i+1;
    end
    pt=pt+stp;
    end
else
  stp=10^(-3);
  pt=stp;
  i=N/2+1;
  while i<=N
    if hf_legendre(pt)*hf_legendre(pt+stp)<0
      stps=5;
      x0=pt;
      tracks = zeros(1,stps);
      tracks(1) = x0;
      for ind1 = 2:stps
        x0 = x0 - hf_legendre(x0)/hf_legendre_gradient(x0);
        tracks(ind1) = x0;
      end
      ret(1,i) = tracks(end);
      ret(1,N-i+1)=-tracks(end);
      i=i+1;
    end
    pt=pt+stp;
  end
end
% ---end coding---
end
%report unittest relative error for legendre_1-15 compared with built-in: 0
