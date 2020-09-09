function yv = BaryInt(xv,xx,ff,lambdas)

N = length(xv);

yv = 0*xv;
for j = 1:N
    yv(j) = sum(lambdas.*ff./(xv(j)-xx+1.0e-15))/sum(lambdas./(xv(j)-xx+1.0e-15));
end

end