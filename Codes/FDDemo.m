clear
clc


f = @(x) sin(x);
fp = @(x) cos(x);
a = 1;

fpex = fp(a);


hvals = 2.^(-4:-1:-40);
lenH = length(hvals);

Errs = zeros(2,lenH);

for j = 1:lenH
    h = hvals(j);
    
    fp1 = (f(a+h)-f(a))/h;
    fp2 = (f(a+h)-f(a-h))/(2*h);
    
    Errs(:,j) = abs(fpex - [fp1 fp2]');
    
end


Ae = [log(hvals') ones(length(hvals),1)]; be = log(Errs'); 
m = (Ae'*Ae)\(Ae'*be); 

loglog(hvals,Errs,'o-','LineWidth',2); grid on

xlabel('$h$','Interpreter','latex')
ylabel('errors')

legend(['$D_h^+$: ' num2str(m(1,1))],['$D_h^0$: ' num2str(m(1,2))],...
    'Interpreter','latex') 

set(gca,'fontsize',16)
set(gcf, 'Position',  [500, 300, 800, 700])







