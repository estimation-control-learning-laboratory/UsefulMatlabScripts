clc
clear all
close all

%% Data for the nonlinear pendulum system
Data.g = 10;
Data.ell = 1;

%% Compute the Jacobians 
syms x_sym [2 1]
syms u_sym
xdot = pendulum(x_sym,u_sym, Data)  % replace function for other systems
A   = jacobian(xdot, x_sym)
B   = jacobian(xdot, u_sym)
%% Evaluate the Jacobians

x_val = zeros(2,1);
u_val = 0;

A_val = double(subs(A, x_sym, x_val))
B_val = double(subs(B, u_sym, u_val))



%% Nonlinear Pendulum Dynamics 
% In general, do not include functions in the runner files
function xdot = pendulum(x,u, Data)
    xdot(1) = x(2);
    xdot(2) = -Data.g/Data.ell *sin(x(1)) + u^2/Data.ell;
end