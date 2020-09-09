clear
clc

f = @(u) sin(1./u - 1); a = 0; b = 1;

Nvals = 2^10;
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

IMPs


