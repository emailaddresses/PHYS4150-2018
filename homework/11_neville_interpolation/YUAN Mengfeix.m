%{
right reserved for [YUAN Mengfeix]
%}


% neville interpolation
% reference: https://en.wikipedia.org/wiki/Neville%27s_algorithm

N = 5;  %give N points
X_IN = (1:N);
Y_IN = X_IN.^3; 
X = 2.5; % want to get f(1.2)
p = ones (N,N);

    
for i =1:N
    p(i,i) = Y_IN(i);
end

for j = 1:N-1
  for i =1:N-j
    
     p(i,i+j) = ((X_IN(i)-X)*p(i+1,i+j)+(X-X_IN(i+j))*p(i,i+j-1))/(X_IN(i)-X_IN(i+j));
    
  end
end

fprintf ('the value at %d is %d', X, p(1,N))

