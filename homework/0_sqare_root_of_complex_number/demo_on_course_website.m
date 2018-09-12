%{
right reserved for A. Einstein
%}


% unittest
hfe = @(x,y) max(max(abs(x-y)./(abs(x)+abs(y)+1e-3)));
assert(hfe(my_square_root_of_complex_number(3,4), sqrt(3+4i))<1e-3, 'your function result has large error')
assert(hfe(my_square_root_of_complex_number(1000,1), sqrt(1000+1i))<1e-3, 'your function result has large error')
assert(hfe(my_square_root_of_complex_number(1e-3,1), sqrt(1e-3+1i))<1e-3, 'your function result has large error')
disp('unittest passed.')
% unittest


function ret = my_square_root_of_complex_number(x_real, x_imag)
%----- start coding from here ----
x_radius = sqrt(sqrt(x_real.^2 + x_imag.^2));
theta = atan(x_imag./x_real)/2;
x_real = x_radius * cos(theta);
x_imag = x_radius * sin(theta);
ret = x_real + 1i*x_imag;
% ---- end coding ----
end
