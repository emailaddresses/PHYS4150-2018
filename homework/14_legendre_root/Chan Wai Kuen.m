%{
right reserved for [Chan Wai Kuen]
%}

function ret = code_template(N)
% find N roots of N-th order legendre polynomial
% (ret)(1,N)
if N==0
    ret = zeros(1,0);
    return;
end

[~, hf_legendre] = my_legendre(N);
hf_legendre_gradient = @(x) (hf_legendre(x+1e-5) - hf_legendre(x-1e-5))/2e-5;     

% ---start coding from here---



size = 2/(6.75*N);
grid_point_list = [ -1 : size : 1];
legendre_grid_point_list = [];
for i = grid_point_list
	legendre_grid_point_list = [ legendre_grid_point_list , hf_legendre(i) ] ; 
end

store_i = [] ;
% see which pair has negative sign
for i = 1: length( legendre_grid_point_list ) - 1
	if legendre_grid_point_list(i) * legendre_grid_point_list(i+1) < 0
		store_i = [ store_i , i ] ;
	end
end

final_roots = [] ;
for j = store_i ;
	[bisec_root, bisec_track] = my_bisection( hf_legendre , grid_point_list( j ) , grid_point_list( j+1 ) , 50 ) ;
	[newton_root, newton_track] = my_newton_raphson( hf_legendre, hf_legendre_gradient , bisec_root, 50) ;
	final_roots = [ final_roots , newton_root] ;
end

ret = final_roots


% ---end coding---
end
