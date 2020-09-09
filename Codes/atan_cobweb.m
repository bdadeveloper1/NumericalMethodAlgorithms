clear
clc

% For solving atan(x) = 0
f = @(x) atan(x);
g = @(x) x - atan(x).*(1+x.^2);

xex = 0;

x0 = 1.4; % converges for up to x0 = 1.39. Diverges after that 

xa = x0;

tol = 1.0e-12; err = 1;

for j = 1:20
  x = g(x0);
  
  fprintf('%16.16f\t%16.16f\n',abs(x - xex),abs(x - xex)/err)
  err = abs(x - xex);
  
  if abs(x-x0) < tol || abs(f(x)) < tol
      break
  end
  
  x0 = x;
end
imax = j;


% Drawing the cobweb diagram for x_(n+1) = g(x_n)

xmin = -2; xmax = 2; 
ymin = -2; ymax = 2;

xv = xmin:0.001:xmax;
yv = g(xv);

plot(xv,xv,'LineWidth',2);
grid on; hold on
plot(xv,yv,'LineWidth',2); 

runs = imax;
r = zeros(1,runs+1); r(1) = xa;
for i = 1:runs
    
    r(i+1) = g(r(i));
    plot([r(i) r(i)],[r(i) r(i+1)],'k:','LineWidth',2)
    plot([r(i) r(i+1)],[r(i+1) r(i+1)],'k:','LineWidth',2)
end

axis([xmin xmax ymin ymax])
xlabel('$x$','Interpreter','latex');
ylabel('$y$','Interpreter','latex');
set(gca,'fontsize',16)

