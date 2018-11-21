function [Q,R] = qr_full_givens(matA)
% apply qr decomposition on full matrix using givens rotation
% reference: see lecture05.pdf (page76-79)
% matA: tri-diagonal
% (ret1)Q(N0,N0): orthogonal matrix
% (ret2)R(N0,N0): upper triangle matrix
N0 = size(matA,1);
R = matA;
Q = eye(N0);
for ind1 = 1:N0-1
    for ind2 = ind1+1:N0
        theta = atan(R(ind2,ind1)/R(ind1,ind1));
        c = cos(theta);
        s = sin(theta);
        
        tmp1 = c*R(ind1,:) + s*R(ind2,:);
        tmp2 = -s*R(ind1,:) + c*R(ind2,:);
        R([ind1,ind2],:) = [tmp1;tmp2];

        tmp1 = c*Q(:,ind1) + s*Q(:,ind2);
        tmp2 = -s*Q(:,ind1) + c*Q(:,ind2);
        Q(:,[ind1,ind2]) = [tmp1,tmp2];
    end
end
end
