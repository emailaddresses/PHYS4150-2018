function unittest()
% reference: wiki: https://en.wikipedia.org/wiki/Pad%C3%A9_approximant
if ~exist('code_template.m', 'file')
    error('DO NOT rename code_template.m')
end

% sin
disp('test sin() function, detail see pade-approximation-wiki')
t = [-1/39916800, 0, 1/362880, 0, -1/5040, 0, 1/120, 0, -1/6, 0, 1, 0];
p = [12671/4363920, 0, -2363/18183, 0, 1, 0];
q = [121/16662240, 0, 601/872784, 0, 445/12122, 0, 1];
single_unittest(t, p, q, @sin);

% exp
disp('test exp() function, detail see pade-approximation-wiki')
t = [1/3628800, 1/362880, 1/40320, 1/5040, 1/720, 1/120, 1/24, 1/6, 1/2, 1, 1];
p = [1/30240, 1/1008, 1/72, 1/9, 1/2, 1];
q = [-1/30240, 1/1008, -1/72, 1/9, -1/2, 1];
single_unittest(t, p, q, @exp);
disp('unittest passed')
end

function single_unittest(t, p, q, hf1)
hfe = @(x,y) max(max(abs(x-y) ./ (abs(x)+abs(y)+1e-3)));
[p_,q_] = code_template(t, size(p,2)-1);
assert(all(size(p)==size(p_)), ['the shape of p in your return should be: (1, L+1)=(1, ', num2str(size(p,2)),')'])
assert(all(size(q)==size(q_)), ['the shape of q in your return should be: (1, M+1)=(1, ', num2str(size(q,2)),')'])

x = linspace(-5,1);
y1 = hf1(x);
y2 = polyval(p_, x) ./ polyval(q_,x);
figure();
hline1 = plot(x, y1);
hold on;
hline2 = plot(x, y2, 'x');
hold off;
legend([hline1,hline2], {'test function', 'your approximation'})

assert(hfe(p, p_)<1e-3, 'p in your result has large error');
assert(hfe(q, q_)<1e-3, 'q in your result has large error');
disp('passed')
end
