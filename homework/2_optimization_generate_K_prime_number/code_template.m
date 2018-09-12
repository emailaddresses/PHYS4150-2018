%{
complete infomation in the sqare brackets []

name: [e.g. Albert Einstein; this is for grading]
uid: [e.g. 31415926535]
put on course website: [yes or no]
right reserved for [e.g. A. Einstein; this will show on github if select yes above]
%}


% unittest
hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
assert(hfe(my_generate_K_prime(7), [2,3,5,7,11,13,17])<1e-3, 'your function result has large error')
assert(hfe(my_generate_K_prime(9), [2,3,5,7,11,13,17,19,23])<1e-3, 'your function result has large error')
disp('unittest pass, but this does not mean two improments have been added')


function ret = my_generate_K_prime(K)
% K(int)
% ret(int,(1,K))
ret = zeros(1,K);
ret(1) = 2;
num_prime_number = 1;
current_x = 3;
while num_prime_number<K
    if my_isprime(current_x, ret(1:num_prime_number))
        num_prime_number = num_prime_number + 1;
        ret(num_prime_number) = current_x;
    end
    current_x = current_x + 1;%optimization 1, TODO
end
end

function ret = my_isprime(num1, known_prime)
% return true if num1 is prime number otherwise false
% num1(int)
% (ret)(bool)
for x = known_prime %optimization 2, TODO
    if is_divisible(num1, x)
        ret = false;
        return
    end
end
ret = true;
end

function ret = is_divisible(a, b)
% return true if a is divisible by b otherwise false
% doc('mod')
ret = mod(a,b)==0;
end
