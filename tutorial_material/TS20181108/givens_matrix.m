function ret = givens_matrix(N0,ind1,ind2,theta)
% Given rotation matrix: https://en.wikipedia.org/wiki/Givens_rotation
% N0/ind1/ind2(int) theta(float)
% ret(N0,N0)
assert(ind1~=ind2);
ret = eye(N0,N0);
c = cos(theta);
s = sin(theta);
ret(ind1,ind1) = c;
ret(ind2,ind2) = c;
ret(ind1,ind2) = -s;
ret(ind2,ind1) = s;
end
