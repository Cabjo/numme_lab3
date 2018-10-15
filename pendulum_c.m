clear all; close all;
l = 0.5;                            % Length of the pendulum
g = 9.82;                           % The standard acceleration of gravity

theta_degree = 25;

u_0 = [theta_degree*pi/180; 0];
f=@(t,u) [u(2); -g/l*sin(u(1))];
% Runge-Kutta:
tspan=[0 2];
h = 0.1;
[tRK,yRK]=RK4(f, tspan, h, u_0);


%[tODE45,yODE45] = ode45(f,tspan, u_0);
%disp(['Value calculated with ODE45 is :' num2str(yODE45(end,2))])
disp(['Value calculated with RK4 is :' num2str(yRK(2, end))])

