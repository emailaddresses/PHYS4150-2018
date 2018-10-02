%{
right reserved for [zwh]
%}


function ret=findprime(K)
% my_generate_K_prime
% K(int)
% ret(int,(1,K))
ret=zeros(1,K);
ret(1) = 2;
num_prime_number = 1;
current_x = 3;
while num_prime_number<K
    if my_isprime(current_x, ret(1:ceil(num_prime_number/2)))
        num_prime_number = num_prime_number + 1;
        ret(num_prime_number) = current_x;
    end
    current_x = current_x + 2;%optimization 1, TODO
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

%{
result
findprime(20)
ans = 2    3    5    7   11   13   17   19   23   29   31   37   41   43   47   53   59   61   67   71
%}
