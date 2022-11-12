function [ xkp1 ] = Lorenz( xk, w, mu )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

w1 = w(1);
w2 = w(2);
w3 = w(3);

dt = 1e-2;  1e-3;

x   = xk(1);
y   = xk(2);
z   = xk(3);

sigma   = mu(1);
rho     = mu(2);
beta    = mu(3);

xkp1(1)     = x + dt * sigma * (y - x)      + dt * w1;
xkp1(2)     = y + dt * (x * (rho - z) - y ) + dt * w2;
xkp1(3)     = z + dt * (x * y - beta * z )  + dt * w3;

xkp1 = xkp1(:); 

end

