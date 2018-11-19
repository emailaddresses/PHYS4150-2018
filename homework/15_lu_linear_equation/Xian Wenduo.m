%{
right reserved for [Xian Wenduo; this will show on github if select yes above]
%}

function P_LU
A = [1,6,3,4;8,25,6,5;9,10,11,29;16,17,14,13];
Y = [2,5,9,12];
Y_copy = Y;        %/ store the orginal Y for comparison
N = size(A,1);
X = zeros(1,N);   %/  A*X = Y
Z = zeros(1,N);    %/  A = LU; so L * U * X = Y; let U*X = Z, so L * Z =Y
[mat_low,mat_up,Y]=Decompose(A,Y);   %/ decompose A to L,U matrix and get a new Y


disp('mat_low = ');
disp(mat_low);
disp('mat_up = ');
disp(mat_up);
disp('Y=');
disp(Y);

%/ find Z according to L * Z = Y
for I = 1:N
    Sum = 0;
    J = 1;
    while J<I
        Sum = Sum + mat_low(I,J)*Z(J);
        J = J+1;
    end
    Z(I)=Y(I)-Sum;
end


% figure out X according to U * X = Z
for i = N:-1:1
    Sum = 0;
    j = i+1;
    while j <=N
        Sum = Sum + mat_up(i,j) * X(j);
        j = j + 1;
    end
    X(i)=(Z(i)-Sum)/mat_up(i,i);
end
disp('X = ');
disp(X);
ref_X = A\(Y_copy');
disp('X by built in function: ');
disp(ref_X);
end

%/using Gauss elimination and matrix pivot method to find up and low matrix
function [mat_low,mat_up,Y]= Decompose(A,Y)
n = size(A,1);
T = eye(n,n);
Y = Y';
%/select the matrix pivot before elimination each time
for i=1:n-1   %/ select the row with biggest absolute value at i th colum and at or under i th row to i row
    [~,index]=max(abs(A(i:end,i)));
    index_row = i + (index-1);
    P = eye(n,n);
    P(i,1:end)=0;
    P(i,index_row)=1;
    P(index_row,1:end)=0;
    P(index_row,i) = 1;
    A = P*A;
    
    %/ determine the matrix M to eliminate the i colum of matrix A
    M = eye(n,n);
    for k = i+1:n
        M(k,i) = -A(k,i)/A(i,i);
    end
    A = M * A;   %/ eliminate the i colum of matrix A and get a new A
    T = M * P*T;  %/ recode all the manipulations which make the newest A from original A
end
mat_up = A;  %/ A becomes a up-triangle matrix finally and that is the up matrix we want
inv_T= inv(T);  %/ according to A = inv_T * mat_up, inv_T should be the low triangle we want
P_z = eye(n,n);  %/ change the sequence of rows of inv_T and make it exactly the low triangle and adjust sequence of elements of Y at the same time
for i=1:n-1
    [~,index]=min(abs(inv_T(i:end,i)-1));
    index_row = i + (index-1);
    P = eye(n,n);
    P(i,1:end)=0;
    P(i,index_row)=1;
    P(index_row,1:end)=0;
    P(index_row,i) = 1;
    inv_T = P*inv_T;
    P_z = P * P_z;     %/ record all manipulations to make inv_T a exact triangle matrix
end
mat_low = inv_T;    %/ after manipulations the inv_T is an exact triangle matrix
Y = P_z * Y;        %/ adjust elements of Y corresponding to the process of making original inv_T low triangle
end