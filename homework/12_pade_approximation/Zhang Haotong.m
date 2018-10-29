%{
right reserved for [Zhang Haotong]
%}

function [p,q] = ZHT_12_pade_approximation(taylor_coefficient, L)
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
%matrix_naive = zeros(L+M+1,L+M+1); 
matrix_A = zeros(L+M+1,L+M+1);

for i=1:1:L+1
    matrix_A(i,i) = 1;
end

%for k =2:1:L+2
%    i=L+2;
%     for a=k:1:k+M-1
%        matrix_A(a,i) = -taylor_coefficient(L+M-k+3);
%        i=i+1;
 %    end
%end

for k =2:1:L+M+1
    i=L+2;
     for a=k:1:k+M-1
         if a<=L+M+1&&i<=L+M+1
        matrix_A(a,i) = -taylor_coefficient(L+M-k+3);
         end
        i=i+1;
     end
end
taylor_coefficient = taylor_coefficient(end:-1:1);
matrix_b = matrix_A^(-1)*taylor_coefficient';
p = (matrix_b(1:L+1,:))';
p = p(end:-1:1);
q = (matrix_b(L+2:L+M+1,:))';
q = q(end:-1:1);
q(M+1)=1;
% --- end coding---
end