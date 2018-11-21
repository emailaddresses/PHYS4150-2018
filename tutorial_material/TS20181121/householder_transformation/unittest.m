function unittest()
hfe = @(x,y) max(reshape(abs(x-y)./(abs(x)+abs(y)+1e-3),[],1));
hfe_r5 = @(x,y) round(hfe(x,y)*1e5)/1e5;

for ind_repeat = 1:10
    N1 = randi([5,20]);
    vec1 = randn(N1,1);
    vec2 = randn(N1,1);
    [mat,~] = householder_matrix(vec1,vec2);
    tmp1 = mat*vec1./vec2;
    disp(['householder_matrix relative error: ', num2str(hfe_r5(tmp1, mean(tmp1,1)))])
end
end
