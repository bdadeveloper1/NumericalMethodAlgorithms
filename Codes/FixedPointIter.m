function [p,imax] = FixedPointIter(g,p0,tol,Nmax)

for i = 1:Nmax
    p = g(p0);
    if abs(p - p0) < tol
        break;
    end
    p0 = p;
end

imax = i;

