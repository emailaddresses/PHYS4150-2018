%{
right reserved for [moooooooooo~]
%}

function [p,q] = code_template(taylor_coefficient, L)
% Pade approximation
% taylor_coeffient(int, (1,N1)): from high order to zero-order
% L(int, (1,1))
% p(float,(1,L+1)): from high order to zero-order
% q(float,(1,M+1)), from high order to zero-order, remember to add zero-order coefficient which is one
%
% reference:
%   wiki: https://en.wikipedia.org/wiki/Pad%C3%A9_approximant
%   http://mathworld.wolfram.com/PadeApproximant.html
%   http://mathfaculty.fullerton.edu/mathews/n2003/pade/PadeApproximationProof.pdf
M = size(taylor_coefficient,2) - 1 - L;
% ---start coding from here---
matrix_A = zeros(L+M+1,L+M+1);   #AX = T
matrix_T = flip((taylor_coefficient)', 1);
for i = 1:L+1
  matrix_A(i,i) = 1;
end
row_i = 2;
for i = L+2:L+M+1
  n = 1;
  for j = row_i:L+M+1
    matrix_A(j,i) = -matrix_T(n,1);
    n++;
  end
  row_i++;
end

x = inv(matrix_A)*matrix_T;
ans = flip(x',2);
q(1,1:M) = ans(1,1:M);  q(1,end+1) = 1; 
p(1,1:L+1) = ans(1,M+1:M+L+1);
% --- end coding---
end
