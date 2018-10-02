%{
right reserved for [Huang Richang]
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
    current_x = current_x + 2;%optimization 1, Done
end
end

function ret = my_isprime(num1, known_prime)
% return true if num1 is prime number otherwise false
% num1(int)
% (ret)(bool)
for x = known_prime %optimization 2, Done
  if x < num1/2
    if is_divisible(num1, x)
        ret = false;
        return
    end
  end 
end
ret = true;
end

function ret = is_divisible(a, b)
% return true if a is divisible by b otherwise false
ret = mod(a,b)==0;
end
