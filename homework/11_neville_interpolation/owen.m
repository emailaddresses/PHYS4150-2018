%{
right reserved for [owen]
%}


function y = code_template(x0, y0, x)
##x1 = [12 13 14 16];
##y1 = [5 6 9 11];
##disp(x1(:));
% neville interpolation
% reference: https://en.wikipedia.org/wiki/Neville%27s_algorithm
% x0(1,N0) y0(1,N0) x(1,N1) y(1,N1)

% --- strat coding from here ---
##########################
#Neville's algorithm 
N0 = size(x0, 2);
y = zeros(N0 ,size(x, 2));
for i = 1:size(x, 2)
  y(:, i) = y0;
end

for i = 1:N0
    for j = 1:(N0-i)
      y(j,:) = (x0(j)-x0(j+i))^-1*((x(1,:) - x0(j+i)).*y(j,:)-(x(1,:) - x0(j)).*y(j+1,:));
    end
end
y = y(1,:);
##########################
% --- end coding ---
end
