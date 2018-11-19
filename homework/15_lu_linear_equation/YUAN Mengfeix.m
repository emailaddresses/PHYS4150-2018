%{
right reserved for [YUAN Mengfeix]
%}

A = [3 1 4; 1 5 9; 2 6 5];
b = [28; 64; 112];

A\b %correct answer

N = size (A,1);
n = size (b,1);

% LU decomposition
m = zeros(N,N);
for i = 1:N
    m(i,i) = 1;
end


for k = 1:N-1
    for i = k+1:N
        a = A(i,k)./A(k,k);
        m(i,k) = a;
        for j = k:N
            A(i,j) = A(i,j)-a*A(k,j);
        end
    end
end
L = m;
U = A;
% LU decomposition end

X = zeros(n,1);
x = zeros(n,1);

X(1,1) = b(1,1)./L(1,1);

for i = 2:n
    s = 0;
    for k = 1:i-1
        s = s+ L(i,k)*X(k,1);
    end
    X(i,1) = (b(i,1)-s)./L(i,i);
end


x(n,1) = X(n,1)./U(n,n);
for i = fliplr (1:n-1)
    s = 0;
    for k = i+1 : n
        s = s+U(i,k)*x(k,1);
    end
    x(i,1) = (X(i,1)-s)./U(i,i);
end

x
