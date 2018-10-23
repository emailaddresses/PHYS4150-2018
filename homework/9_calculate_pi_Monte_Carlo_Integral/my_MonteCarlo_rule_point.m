function ret = my_MonteCarlo_rule_point(hf1, a, b, num_point)
sum_ = 0;
for ind1 = 1:num_point
    x = rand() * (b-a) + a;
    sum_ = sum_ + hf1(x);
end
ret = sum_ / num_point * (b-a);
end
