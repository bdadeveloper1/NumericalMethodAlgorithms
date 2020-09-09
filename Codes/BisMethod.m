function p = BisMethod(f,a,b,tol)

N = ceil(log2((b-a)/tol)-1);
fa = f(a); fb = f(b);

if sign(fa)*sign(fb) >= 0
    error('a and b chosen incorrectly')
end

for i = 1:N
    p = (a+b)/2;
    fp = f(p);
    if abs(f(p)) < tol
        break
    elseif sign(fa)*sign(fp) < 0 %signs of f(a), f(p) opposite
        b = p; fb = fp;
    else %signs of f(p), f(b) opposite
        a = p; fa = fp;
    end
end

p = (a+b)/2;

end
