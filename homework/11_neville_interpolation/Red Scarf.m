%{
right reserved for [Red Scarf]
%}

function y = code_template(x0, y0, x)
% neville interpolation
% reference: https://en.wikipedia.org/wiki/Neville%27s_algorithm
% x0(1,N0) y0(1,N0) x(1,N1) y(1,N1)
N0 = size(x0, 2);
N1 = size(x,2);
y=zeros(1,N1);
for m=1:N1
  p=zeros(N0+1);
  for dif=0:N0-1
    for i=1:N0
      j=i+dif;
      if j<=N0
        if dif==0
          p(i,j)=y0(1,i);
        else
          p(i,j)=((x(1,m)-x0(1,j))*p(i,j-1)-(x(1,m)-x0(1,i))*p(i+1,j))/(x0(1,i)-x0(1,j));
        endif
      endif
    endfor
  endfor
y(1,m)=p(1,N0); 
endfor 
end

