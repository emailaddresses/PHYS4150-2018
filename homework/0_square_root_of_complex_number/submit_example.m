%{
complete infomation in the sqare brackets []

name: Albert Einstein
uid: 3.1415926535
put on course website: yes
right reserved for A. Einstein
%}

disp('this is submit_example. [not include this line]')

function ret = code_template(x_real, x_imag)
% my_square_root_of_complex_number
%----- start coding from here ----
x_radius = sqrt(sqrt(x_real.^2 + x_imag.^2));
theta = atan(x_imag./x_real)/2;
x_real = x_radius * cos(theta);
x_imag = x_radius * sin(theta);
ret = x_real + 1i*x_imag;
% ---- end coding ----
end
