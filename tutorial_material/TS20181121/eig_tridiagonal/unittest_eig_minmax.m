function unittest_eig_minmax()
% Gershgorin Circle Theorem WIKI: https://en.wikipedia.org/wiki/Gershgorin_circle_theorem
% here is a special case: symmetric matrix so that all eigvalues are real

for ind_repeat = 1:20
    N0 = randi([5,20]);
    tmp1 = rand(N0); matA = triu(tmp1) + triu(tmp1,1).'; %general case
    % tmp1 = rand(N0-1,1); matA = diag(rand(N0,1)) + diag(tmp1, 1) + diag(tmp1,-1); %tridiagonal case
    min_ = min(diag(matA) - (sum(abs(matA),2) - abs(diag(matA))));
    max_ = max(diag(matA) + (sum(abs(matA),2) - abs(diag(matA))));
    ret = eig(matA);
    assert(all(ret>min_));
    assert(all(ret<max_));
end
end
