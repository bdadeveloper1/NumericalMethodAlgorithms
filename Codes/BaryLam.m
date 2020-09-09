function lambdas = BaryLam(xx)

N = length(xx);
lambdas = 1+0*xx;

for j = 1:N
    lambdas(j) = 1/prod(xx([1:j-1 j+1:N]) - xx(j));
end


end

