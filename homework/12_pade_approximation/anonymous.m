%{
right reserved for []
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
leftup = eye(L+1);
leftdown = zeros(M,L+1);
left = cat(1,leftup,leftdown);
right = zeros(length(taylor_coefficient),M);
t = -fliplr(taylor_coefficient)';
for i = 1:M
    for j = i+1:length(taylor_coefficient)
        right(j,i) = t(j-i);
    end
end



matrix_A = cat(2,left,right);


matrix_b = fliplr(taylor_coefficient)';

solve = matrix_A\matrix_b;
p = fliplr(solve(1:L+1)')
q = fliplr(solve(L+1:end)')
q(end) = 1
% --- end coding---
end