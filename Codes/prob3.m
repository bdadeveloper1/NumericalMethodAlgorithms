clear
clc

%f = @(x) (1-cos(x))./(x.^2); a = 0; b = pi/2;
f = @(x) (exp(x)-1)./(x); a = 0; b = 1;

Nvals = 2.^(0:3);
len = length(Nvals);

IMPs = zeros(1,len);

for j = 1:len
    N = Nvals(j);
    h = (b-a)/N;
    
    zz = linspace(a,b,2*N+1);
    yy = zz(2:2:end);
    
      
    Imp = h*sum(f(yy));
    IMPs(j) = Imp;
   
end

IMPs'

% for j = 1:len
%     fprintf('& $ %17.15f $\t',IMPs(j))
% end


