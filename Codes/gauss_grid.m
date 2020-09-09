function [X,W] = gauss_grid(N)

% this function calculates the N-point
% Gauss quadrature nodes (given in vector X)
% and the corresponding weights (given in W)

A = zeros(N,N);
for i = 1:N-1
    b = i^2/(4*i^2 - 1);
    A(i,i+1) = sqrt(b);
    A(i+1,i) = A(i,i+1);
end

[V , D] = eig(A);

X = diag(D);

W = V(1,:)'; 
W = 2*W.^2;

end
