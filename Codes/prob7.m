clear
clc

tol = 1.0e-12;

f = @(u) 1./(u+5);

intval = 2; fac = 4;
for n = 1:10
    intval = intval*(n^2/(4*n^2 - 1));
    fac = fac*16;
    
    a = intval/fac;
    
    if a < tol
        break
    end
end

n %the smallest value of n for which E_n \leq 10^{-12} is guaranteed

[X,W] = gauss_grid(n);

Iapp = W'*f(X);

abs(Iapp - log(1.5))



