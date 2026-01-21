%% Bifurcation and phase portraits
% x' = -2x^3 - kappa*x*y^3 + 4*x*y
% y' = -y + y*x^2 - 4*x^2 + lambda

clear; clc; close all;

%% Phase space grid
[x,y] = meshgrid(linspace(-1,1,25));

%% Parameter sets (regions in parameter space)
params = [
    0.5  -0.5;
    0.5   0;
    0.5   0.5;
   -0.5  -0.5;
   -0.5   0.5
];

for k = 1:size(params,1)
    kappa  = params(k,1);
    lambda = params(k,2);

    dx = -2*x.^3 - kappa*x.*y.^3 + 4*x.*y;
    dy = -y + y.*x.^2 - 4*x.^2 + lambda;

    figure; hold on; grid on
    quiver(x,y,dx,dy,'k')
    axis equal
    axis([-1 1 -1 1])

    title(['Phase portrait for \kappa = ',num2str(kappa), ...
           ', \lambda = ',num2str(lambda)])
    xlabel('x')
    ylabel('y')
end

%% Bifurcation diagram (equilibria vs lambda)
lambda_vals = linspace(0,1,200);
x_eq = sqrt(2*lambda_vals/9);

figure; hold on; grid on
plot(lambda_vals, zeros(size(lambda_vals)),'k','LineWidth',1.5)
plot(lambda_vals,  x_eq,'r','LineWidth',1.5)
plot(lambda_vals, -x_eq,'r','LineWidth',1.5)

xlabel('\lambda')
ylabel('Equilibria x')
title('Local bifurcation diagram (pitchfork)')
