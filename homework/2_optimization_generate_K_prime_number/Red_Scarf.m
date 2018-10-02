%{
right reserved for [Red Scarf]
%}


function ret = code_template(K)
% my_generate_K_prime
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
    if x >= sqrt(num1)
        break
    end
end
ret = true;
end

function ret = is_divisible(a, b)
% return true if a is divisible by b otherwise false
% doc('mod')
ret = mod(a,b)==0;
end
