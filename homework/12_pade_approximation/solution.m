function [p,q] = solution(taylor_coefficient, L)
% Pade approximation
% taylor_coeffient(float, (1,N1)): from high order to zero-order
% L(int, (1,1))
% p(float,(1,L+1)): from high order to zero-order
% q(float,(1,M+1)), from high order to zero-order, remember to add zero-order coefficient which is one
%
% reference:
%   wiki: https://en.wikipedia.org/wiki/Pad%C3%A9_approximant
%   http://mathworld.wolfram.com/PadeApproximant.html
%   http://mathfaculty.fullerton.edu/mathews/n2003/pade/PadeApproximationProof.pdf
M = size(taylor_coefficient,2) - 1 - L;
reverse_taylor = flip(taylor_coefficient, 2);
tmp1 = full(spdiags(repmat(reverse_taylor(1:(end-1)),M,1),-1:-1:(-L-M),L+M+1,M));
matA = [[eye(L+1); zeros(M,L+1)], -tmp1];
tmp1 = matA\reverse_taylor.';
p = flip(tmp1(1:L+1),1).';
q = [flip(tmp1(L+2:end),1).',1];
end
