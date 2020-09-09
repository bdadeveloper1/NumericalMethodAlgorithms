clear
clc

b2 = 0.04;
d1 = 0.3; d2 = 0.4; 

a = 0; b = 10; 
h = 0.001; w0 = [99 ; 1 ; 0 ; 0];

gam = 0.2; 
f = @(t,x) [-b2*x(1)*x(2) ; ...
    b2*x(1)*x(2)-d1*x(2)-gam*x(2); gam*x(2)-d2*x(3)  ; d1*x(2)+d2*x(3)];  
[w,T] = FEsys(f,a,b,h,w0);

plot(T,w(2,:)+w(3,:),'LineWidth',2)
w(:,end)

hold on

gam = 1.2;
f = @(t,x) [-b2*x(1)*x(2) ; ...
    b2*x(1)*x(2)-d1*x(2)-gam*x(2); gam*x(2)-d2*x(3)  ; d1*x(2)+d2*x(3)];  
[w,T] = FEsys(f,a,b,h,w0);

plot(T,w(2,:)+w(3,:),'LineWidth',2)
w(:,end)

gam = 2.5;
f = @(t,x) [-b2*x(1)*x(2) ; ...
    b2*x(1)*x(2)-d1*x(2)-gam*x(2); gam*x(2)-d2*x(3)  ; d1*x(2)+d2*x(3)];  
[w,T] = FEsys(f,a,b,h,w0);

plot(T,w(2,:)+w(3,:),'LineWidth',2)

w(:,end)

grid on

xlabel('$t$','Interpreter','latex')
ylabel('$D(t)$','Interpreter','latex')

set(gca,'fontsize',16)
set(gcf, 'Position',  [500, 300, 800, 700])

