clear
clc

f = @(t,x) 2*t*(1+x.^2);
fex = @(t) tan(t.^2);

a = 0; b = 1; w0 = 0;


hvals = 2.^(-4:-1:-20);
len = length(hvals); 
Errs = zeros(1,len);

for j = 1:len
    h = hvals(j);
    
    [w,T] = FEsys(f,a,b,h,w0);
    
    yex = fex(T);
    
    Errs(j) = abs(yex(end) - w(end));
    
end

Ae = [log(hvals') ones(length(hvals),1)]; be = log(Errs'); 
m = (Ae'*Ae)\(Ae'*be); 
m(1,:)

loglog(hvals,Errs,'o-','LineWidth',2); grid on
hold on

rng = hvals(2:end-1);
plot(rng,rng,'--','LineWidth',2)

xlabel('$h$','Interpreter','latex')
ylabel('errors')

   
set(gca,'fontsize',16)
set(gcf, 'Position',  [500, 300, 800, 700])

Ords = log(Errs(1:end-1)./Errs(2:end))/log(2); Ords(end+1) = 0;

[Errs' Ords']

% for j = 1:len
%     fprintf(['$' num2str(j+3) '$ & $' num2str(Errs(j)) '$ & $' num2str(Ords(j)) '$ \n'])
% end
    




