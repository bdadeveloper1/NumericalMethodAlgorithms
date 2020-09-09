clear
clc

% For solving x-cos(x) = 0
f = @(x) x - cos(x);
g1 = @(x) (x*sin(x) + cos(x))/(1+sin(x));
g2 = @(x) cos(x);
xex = 0.739085133215161;
x0 = 1; 

% For solving x^N-a = 0
% a = 20; N = 4; xex = a^(1/N);
% f = @(x) x^N - a;
% g1 = @(x) (N-1)/N*x + a./(N*x.^(N-1));
% x0 = a/N;


tol = 1.0e-12; err = 1;

for j = 1:120
  x = g1(x0);
  
  fprintf('%16.16f\t%16.16f\n',abs(x - xex),abs(x - xex)/err)
  err = abs(x - xex);
  
  if abs(x-x0) < tol || abs(f(x)) < tol
      break
  end
  
  x0 = x;
end


