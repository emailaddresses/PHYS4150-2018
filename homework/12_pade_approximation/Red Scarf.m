%{
right reserved for [Red Scarf]
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
matrix_A = zeros(L+M+1);
matrix_b = zeros(L+M+1,1);
for i=1:L+M+1
  matrix_b(i,1)=taylor_coefficient(1,L+M+1-i+1);
endfor
for i=1:L+1
  matrix_A(i,i)=1;
endfor

for j=L+2:L+M+1
  for i=j-L:L+M+1
    matrix_A(i,j)=-matrix_b(i-j+L+1,1);
   endfor
endfor

x=matrix_A\matrix_b;
p=zeros(1,L+1);
q=zeros(1,M+1);
for i=1:L+1
  p(1,i)=x(L+1-i+1,1);
endfor 
q(1,M+1)=1;
for i=1:M
  q(1,i)=x(M+L+1-i+1,1);
endfor
% --- end coding---
end