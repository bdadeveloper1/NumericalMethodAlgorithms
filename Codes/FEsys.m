function [w,T] = FEsys(f,a,b,h,w0)
m = length(w0);
n = ceil(abs((b-a)/h));
w = zeros(m,n+1);
T = linspace(a,b,n+1);
w(:,1) = w0;
for i = 1:n
    w(:,i+1) = w(:,i) + h*f(T(i),w(:,i));
end
