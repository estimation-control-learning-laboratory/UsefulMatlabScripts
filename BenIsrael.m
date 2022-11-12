function [ X, ii, jj ] = BenIsrael( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

alpha   = 2/max(sum(abs(A*A'),2));

X   = nan;
jj  = 0;

while sum(isnan(X)) 
    jj      = jj+1;
    alpha   = alpha/2;
    
    
    X       = alpha * A';
    %X       = inv(A'*A + 1e+2*eye(n)) * A'
    Xerr    = 10;
    ii      = 0;
    while Xerr > 1e-8
        X1      = 2*X - X*A*X;
        Xerr    = norm(X1-X, 'fro');
        X       = X1;
        ii      = ii+1;
    end
    if jj==10
        break
    end
end

if sum(isnan(X))
    keyboard
end

end

