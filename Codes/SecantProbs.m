clear
clc

% f = @(x) x.^3.*exp(x) - 1;
% x0 = 0.5; x1 = 1;

% f = @(x) log(x)-cos(x); 
% x0 = 1; x1 = 1.5;

f = @(x) x^x-20; 
x0 = 2; x1 = 3;


tol = 1.0e-8; Nmax = 20;

for j = 1:Nmax
    x = (x0*f(x1) - x1*f(x0))/(f(x1) - f(x0));
    
    
    if abs(x-x1) < tol || abs(f(x)) < tol
        break
    end
    
    x0 = x1;
    x1 = x;
end

x




