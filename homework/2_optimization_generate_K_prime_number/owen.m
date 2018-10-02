%{
right reserved for [owen]
%}

function ret = code_template(K)
% my_generate_K_prime
% K(int)
% ret(int,(1,K))
ret = zeros(1,K);
ret(1) = 2; ret(2) = 3;  % octave not counting from ZERO
num_prime_number = 2;
current_x = 5;
while num_prime_number<K
    if my_isprime(current_x, ret(2:num_prime_number)) % : ranging from 2 to num_prime_number
        num_prime_number = num_prime_number + 1;
        ret(num_prime_number) = current_x;
    end
    % current_x = current_x + 1; %optimization 1, TODO
    current_x += 2; %HW task: ....increase N by 2 each time..... for all odd numbers
end
end

function ret = my_isprime(num1, known_prime)
% return true if num1 is prime number otherwise false
% num1(int)
% (ret)(bool)
ret = true;
for x = known_prime
    if x > num1/2     %HW task: ....do not need to go through the entire list of the existing prime numbers....
        return
    end
    if is_divisible(num1, x)
        ret = false;
        return
    end
end
end

function ret = is_divisible(a, b)
% return true if a is divisible by b otherwise false
% doc('mod')
ret = mod(a,b)==0;
end
