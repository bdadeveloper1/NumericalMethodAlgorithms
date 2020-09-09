clear
clc


f = @(x) x./(1+x.^2);
a = 0; b = 4;

% f = @(x) exp(-x.^2);
% a = 0; b = 2;

n_max = 20;
tol = 1.0e-8;

R = zeros(n_max,n_max); h = (b-a)./2.^(0:n_max-1);
R(1,1) = h(1)/2*(f(a) + f(b));
for i = 2:n_max
    R(i,1) = 0.5*(R(i-1,1) + h(i-1)*sum(f(a + h(i)*(1:2:(2^(i-1) - 1) ) )));
    for j = 2:i
        R(i,j) = R(i,j-1) + (R(i,j-1) - R(i-1,j-1))/(4^(j-1) - 1);
    end
    
    if abs(R(i,i) - R(i-1,i-1)) < tol
        break
    end
    
end

R(i,i)

