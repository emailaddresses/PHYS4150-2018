%{
right reserved for [YUAN Mengfeix]
%}


%function [p,q] = code_template(taylor_coefficient, L)
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
syms x;
N = 9;

taylor_coefficient = sym2poly(taylor (cos(x),'Order',N));
L =4;

M = size(taylor_coefficient,2) - 1 - L;
% ---start coding from here---
matrix_B = flipud(taylor_coefficient');

matrix_a1 = diag(ones(1,L+1));
matrix_a2 = zeros(M,L+1);
matrix_a3 = cat(1,matrix_a1,matrix_a2);
matrix_a4 = zeros(L+M+1,M);
 for i = 1:L+M+1
     for j = 1:i-1
         if j < M+1
         matrix_a4(i,j) = -matrix_B(i-j,1);
         end
     end
 end
 
matrix_A = cat(2,matrix_a3,matrix_a4);

x = matrix_A\matrix_B

p = ones(1,L+1);
q = ones(1,M+1);

for i = 1:L+1
    p(1,i) = x (i,1);
    fprintf ('p(%d) = %d\n',i-1,p(1,i)) 
end


j = 2;
for i = L+2:N
    q(1,j) = x(i,1);
   
    fprintf ('q(%d) = %d\n',j-1,q(1,j)) 
     j = j+1;
end






    
% --- end coding---


