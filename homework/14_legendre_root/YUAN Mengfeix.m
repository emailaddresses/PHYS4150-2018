%{
right reserved for [YUAN Mengfeix]
%}

N =11;
[~, hf_legendre] = my_legendre(N);
root = [];
x = -1:1e-5:1;
for i = 1:size(x,2)-1
    if hf_legendre(x(i))*hf_legendre(x(i+1))<=0
        root = [root,(x(i)+x(i+1))/2];
    end
end
root






