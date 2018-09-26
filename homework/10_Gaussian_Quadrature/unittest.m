function unittest()
hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;

for ind1 = 1:5
    [hf1,a,b,~] = new_test_function();
    ret1 = integral(hf1, a, b);
    ret2 = code_template(hf1, a, b, 12);
    disp(['relative error compare with built-in: ', num2str(hfe_r5(ret1,ret2),7)])
end
end

function [hf1, a, b, built_in_ret] = new_test_function()
tmp1 = rand(1);
tmp2 = 5 + rand(1);
hf1 = @(x) x.^tmp1.*sin(tmp2*x).^2;
a = rand(1);
b = rand(1) + 1 + a;
built_in_ret = integral(hf1, a, b);
end
