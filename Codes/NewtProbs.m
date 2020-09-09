clear
clc

% f = @(x) x.^3.*exp(x) - 1;
% g = @(x) (x.^3*exp(x).*(x+2)+1)./(x.^2.*exp(x).*(3+x));
% x0 = 1;

% f = @(x) log(x)-cos(x); 
% g = @(x) (1+x*sin(x) - log(x) + cos(x))/(1/x+sin(x));
% x0 = 1.5;

f = @(x) x^x-20; 
g = @(x) (x^(x+1)*(log(x)+1) - x^x + 20)/(x^x*(log(x)+1));
x0 = 3;

tol = 1.0e-8; Nmax = 20;


for j = 1:Nmax
    x = g(x0);
    
    if abs(x-x0) < tol || abs(f(x)) < tol
        break
    end
    
    x0 = x;
end

x




