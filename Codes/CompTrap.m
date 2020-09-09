function val = CompTrap(f,a,b,n)

x = linspace(a,b,n+1); h = (b-a)/n;

val = f(a) + f(b); val = val/2;
for i = 2:n
    val = val + f(x(i));
end

val = h*val;




