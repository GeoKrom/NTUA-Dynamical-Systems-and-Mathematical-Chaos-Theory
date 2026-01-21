%% Bifurcation analysis for the system
% x' = (lambda + 1)x + y^2
% y' = 2(lambda - 1)y + x + y^2

clear; clc; close all;

%% Phase space grid
[x,y] = meshgrid(linspace(-2,2,20));

%% Parameter values (before, between and after bifurcations)
lambda_values = [-2, -1, -0.5, 0, 0.5, 1, 2];

for k = 1:length(lambda_values)
    lambda = lambda_values(k);

    % Vector field
    dx = (lambda + 1).*x + y.^2;
    dy = 2*(lambda - 1).*y + x + y.^2;

    figure; hold on; grid on
    quiver(x,y,dx,dy,'k')
    plot(0,0,'ro','MarkerFaceColor','r')

    axis equal
    axis([-2 2 -2 2])

    title(['Phase portrait for \lambda = ',num2str(lambda)])
    xlabel('x')
    ylabel('y')
end

%% Representative trajectories using ode45
lambda = 0;   % choose a value between the two bifurcations

f = @(t,z) [
    (lambda + 1)*z(1) + z(2)^2;
    2*(lambda - 1)*z(2) + z(1) + z(2)^2
];

tspan = [0 10];
initial_conditions = [
    0.2  0.2;
   -0.5  0.3;
    0.5 -0.5;
   -0.3 -0.2
];

figure; hold on; grid on
for i = 1:size(initial_conditions,1)
    [t,z] = ode45(f,tspan,initial_conditions(i,:));
    plot(z(:,1),z(:,2),'LineWidth',1.5)
end

plot(0,0,'ro','MarkerFaceColor','r')
axis equal
title('Trajectories for \lambda = 0')
xlabel('x')
ylabel('y')
