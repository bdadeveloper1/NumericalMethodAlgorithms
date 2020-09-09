clear
clc

T0 = 0; Tf = 60;
hvals = 2.^(-1:-1:-9);

lenH = length(hvals);

f = @(t) (t.^2+10)./(t.^2+100) + 0.1*sin((t/4).^2);

h = 2^(-10);
Tvals = T0:h:Tf;
Iex = CompSimp(f,T0,Tf,length(Tvals)-1);

IntVals = zeros(2,lenH);

for j = 1:lenH
     
    h = hvals(j);

    Tvals = T0:h:Tf;

    vels = f(Tvals);

    Itr = CompTrap(f,T0,Tf,length(Tvals)-1);
    Isimp = CompSimp(f,T0,Tf,length(Tvals)-1);
    
    IntVals(:,j) = [Itr Isimp]';
    
end

Errs = abs(IntVals - Iex);

if lenH > 1
    Ae = [log(hvals') ones(length(hvals),1)]; be = log(Errs'); 
    m = (Ae'*Ae)\(Ae'*be); 
    m(1,:)

    loglog(hvals,Errs,'o-','LineWidth',2); grid on

    xlabel('$h$','Interpreter','latex')
    ylabel('errors')

else
    
    plot(Tvals,vels,'LineWidth',2)
    grid on
    axis([Tvals(1) Tvals(end) 0 1.3])
    
    xlabel('$t$','Interpreter','latex')
    ylabel('$v(t)$','Interpreter','latex')
    
end

set(gca,'fontsize',16)
set(gcf, 'Position',  [500, 300, 800, 700])

% for j = 1:9
%     fprintf(['$' num2str(j) '$ & $' num2str(Errs(1,j)) '$ & $' ...
%         num2str(Errs(2,j)) '$ \n'])
% end
    
% Ords = log(Errs(:,1:end-1)./Errs(:,2:end))/log(2);
% for j = 1:8
%     fprintf(['$' num2str(j) '$ & $' num2str(Ords(1,j)) '$ & $' ...
%         num2str(Ords(2,j)) '$\n'])
% end

