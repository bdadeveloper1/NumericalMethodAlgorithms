clear
clc

N = 101; tol = 1.0e-16;
f = @(x) sin(pi*x);

xv = linspace(0,1,N); xv = xv'; 

xt = exp(-1); fex = f(xt);

A = zeros(N); A(:,1) = f(xv);

Evs = zeros(1,N); Evs(1) = abs(A(1,1) - fex);

for i = 2:N
    for j = 2:i
        A(i,j) = (A(i-1,j-1)*(xv(i)-xt) - A(i,j-1)*(xv(i-j+1)-xt))/(xv(i)-xv(i-j+1));
    end
    
    Evs(i) = abs(A(i,i) - fex);
    
    if abs(A(i,i) - A(i-1,i-1)) < tol
        break
    end
end

(i-1)
max(abs(A(i,i) - fex))

semilogy(0:i-1,Evs(1:i),'o-','LineWidth',2)
xlabel('$n$','Interpreter','latex')
ylabel('$|f(e^{-1}) - P_{0:n}(e^{-1})|$','Interpreter','latex')

set(gca,'fontsize',16)
grid on




