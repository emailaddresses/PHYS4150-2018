hf1 = @sin;
a = -rand()*pi;
b = rand()*pi;

fig = figure();
ax = axes('Parent', fig, 'NextPlot', 'add', 'Box', 'on');
ax.Title.String = 'demo bisection method';
x = linspace(-pi, pi, 100);
plot(x, hf1(x))
hline1 = plot([a,a],[-1,1],'r');
hline2 = plot([b,b],[-1,1],'r');
hline3 = plot([1,1]*(a+b)/2,[-1,1],'r');
grid on;
fa = hf1(a);
fb = hf1(b);
for ind1 = 1:8
    new_x = (a+b)/2;
    fx = hf1(new_x);
    if fx*fa<0
        b = new_x;
        fb = fx;
    elseif fx*fb<0
        a = new_x;
        fa = fx;
    else
        break
    end
    hline1.XData = [a,a];
    hline2.XData = [b,b];
    hline3.XData = [1,1]*(a+b)/2;
    pause(1.5);
end
