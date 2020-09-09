clear
clc

f = @(x) exp(sin(x));
a = 0; b = 2*pi;

Nvals = 2:2:16;
len = length(Nvals);

IntVals = zeros(1,len);

for j = 1:len
     
    IntVals(j) = CompTrap(f,a,b,Nvals(j)); 

end

Errs = abs(IntVals(1:end-1) - IntVals(end));

if len > 1
    
    Ae = [Nvals(1:end-1)' ones(len-1,1)]; be = log(Errs'); 
    m = (Ae'*Ae)\(Ae'*be); 
    a = exp(m(1,:));
    
    semilogy(Nvals(1:end-1),Errs,'o-','LineWidth',2); grid on
    hold on
    
    plot(Nvals(2:end-2),a.^Nvals(2:end-2),'--','LineWidth',2)

    xlabel('$N$','Interpreter','latex')
    ylabel('errors')

    
end

set(gca,'fontsize',16)
set(gcf, 'Position',  [500, 300, 800, 700])

Errs(end+1) = 0;

% for j = 1:len
%     fprintf('$ %d $ & $ %17.15f $ & $ %s $ \n',j,IntVals(j),Errs(j))
% end


