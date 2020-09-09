function val = CompSimp(f,a,b,n)

if mod(n,2) ~= 0
    error('n must be even')
end


x = linspace(a,b,n+1); h = (b-a)/n;

val = f(a) + f(b);
for i = 2:2:n
    val = val + 4*f(x(i));
    if i > 2
        val = val + 2*f(x(i - 1));
    end
end

val = h/3*val;




