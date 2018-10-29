%{
right reserved for [Andrew W. Yik]
%}


function y = code_template(x0, y0, x)
% neville interpolation
% reference: https://en.wikipedia.org/wiki/Neville%27s_algorithm
% x0(1,N0) y0(1,N0) x(1,N1) y(1,N1)
N0 = size(x0, 2);
y = zeros(1, size(x,2));
for m=1:size(x,2)
    p=zeros(N0+1);
    for dis=0:N0-1
        for i=1:N0
            j=i+dis;
            if j<=N0
                if dis==0
                    p(i,j)=y0(1,i);
                else
                    p(i,j)=(p(i,j-1)*(x(1,m)-x0(1,j))-p(i+1,j)*(x(1,m)-x0(1,i)))/(x0(1,i)-x0(1,j));
                end
            end
        end
    end
    y(1,m)=p(1,N0);
end

% --- end coding ---
end
