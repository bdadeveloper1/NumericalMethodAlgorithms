clear
clc

L = 4; vD = 2; vC = 1;

f = @(t,x) vD*[-x(1) ; (vC*t-x(2))]./sqrt(x(1).^2+(vC*t-x(2)).^2);

w0 = [L 0]';
a = 0; b = 3;
h = 0.001;

[w,T] = FEsys(f,a,b,h,w0);

% Uncomment this for dog-cat paths
plot(w(1,:),w(2,:),'LineWidth',2)
hold on
plot([0 0],[0 3],'--','LineWidth',2)

% Uncomment this for the distance plot
% s = sqrt(w(1,:).^2 + (vC*T-w(2,:)).^2);
% plot(T,s,'LineWidth',2)
% xlabel('$t$','Interpreter','latex')
% ylabel('$s(t)$','Interpreter','latex')



grid on
set(gca,'fontsize',16)
set(gcf, 'Position',  [500, 300, 800, 700])

