function [ x_1 ] = Mathieu( x, u , k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


Ts      = 0.01;
alpha   = 1;
beta    = 1;
w       = 2;
b       = 1;
t       = Ts * k;
x       = x(:);
x_1(1)  = x(1) + Ts * x(2);
x_1(2)  = x(2) - Ts * (alpha + beta * cos(w*t))*x(1) + Ts * b* u;

x_1     = x_1(:);

end

