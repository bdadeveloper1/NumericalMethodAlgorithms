clear
clc


f = @(x) [(x(1))^2-cos(x(2))-4 ; 5*x(2)+sin(x(1))-2];

x0 = [2 1]'; x = x0;
for j = 1:20
    
    J = [2*(x(1)) sin(x(2)) ; cos(x(1)) 5];
    F = f(x);
    dev = J\F;
        
    if max(abs(dev)) < 1.0e-14
        break
    end
    
    x = x - dev;
    
end

f(x)


