%{
right reserved for [Richang HUANG]
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
tem = taylor_coefficient';
b = flipud(tem);
A = zeros(size(taylor_coefficient,2));
A(1,1) = 1;
for i = 2:L+1
   A(i,i) = 1;
   for j = 1:i-1
   A(i,L+1+j) = - b(i-j,1);
   end
    
end
for i = L+2:size(taylor_coefficient,2)
   for j = L+2:size(taylor_coefficient,2)
   A(i,j) = - b(L+i-j+1,1);
   end   
end

x = A\b;
p = zeros(1,L+1);
q = zeros(1,M+1);
for i = 1:L+1
    p(1,i) = x(i,1);
end
q(1,1) = 1 ;
for i = 2:M+1
    q(1,1) = 1 ;
    q(1,i) = x(L+i,1);
end
p = fliplr(p);
q = fliplr(q);

% --- end coding---
end