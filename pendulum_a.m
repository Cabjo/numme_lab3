clear all, close all, clc
format long
theta_0 = 5:5:90;
theta_size = size(theta_0);
I_theta = zeros(theta_size);
T = zeros(theta_size);
theta_0 = theta_0*pi/180;           % Theta_0 in radians
l = 0.5;                            % Length of the pendulum
g = 9.82;                           % The standard acceleration of gravity
t = @(i) 4*sqrt(l/g)*i;

for i = 1:theta_size(2)
    theta = theta_0(i);
    k = sin(theta/2);
    f = @(alpha) 1./sqrt(1 - k.^2.*sin(alpha).^2);
    h = 0.0001;
    x=0+h:h:pi/2-h;
    I_theta(i) = h/2*(f(0)+f(pi/2)+sum(f(x)));
    T(i) = t(I_theta(i));
end



