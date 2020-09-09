function [c,imax,d] = FalsePos(f,a,b,tol,Nmax)

fa = f(a); fb = f(b);

if sign(fa)*sign(fb) >= 0
    error('a and b chosen incorrectly')
end

for i = 1:Nmax
    c = (a*fb - b*fa)/(fb-fa);
    
    [a b]
    
    fc = f(c);
    if abs(fc) < 1.0e-14
        break
    elseif sign(fa)*sign(fc) < 0 %signs of f(a), f(p) opposite
        b = c; fb = fc;
    else %signs of f(p), f(b) opposite
        a = c; fa = fc;
    end
    
    if abs(b-a) < tol
        break
    end
    
end

c = (a*fb - b*fa)/(fb-fa);

imax = i; d = b-a;

end
