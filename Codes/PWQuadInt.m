clear
clc

% Needs BaryLam and BaryInt files in the same directory

f = @(x) cos(x);
x0 = 0; xf = pi;
N = 124; 

fac = 50;
Np = fac*N; 

xv = linspace(x0,xf,N+1);

fv = f(xv);

xvp = linspace(x0,xf,Np+1);
Pv = 0*xvp;

ips = 1:3;
evps = 1:ceil(1.5*fac);

lambdas = BaryLam(xv(ips));
Pv(evps) = BaryInt(xvp(evps),xv(ips),fv(ips),lambdas);

for j = 1:N-3
    ips = j+1:j+3;
    evps = ceil(1.5*fac) + (j-1)*fac + (1:fac);
    
    lambdas = BaryLam(xv(ips));
    Pv(evps) = BaryInt(xvp(evps),xv(ips),fv(ips),lambdas);
end

ips = [N-1 N N+1];
evps = floor((N-1.5)*fac):Np+1;

lambdas = BaryLam(xv(ips));
Pv(evps) = BaryInt(xvp(evps),xv(ips),fv(ips),lambdas);


plot(xv,fv,xvp,Pv);
grid on

max(abs(f(xvp) - Pv))




