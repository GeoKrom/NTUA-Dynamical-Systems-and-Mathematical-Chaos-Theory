%% Bifurcation diagram for the logistic map
% Stable: blue
% Unstable: red dashed

clear; clc; close all;

%% Parameters
lambda_star = 1 + sqrt(6);
lambda = linspace(0.001, lambda_star, 4000);

N = 1500;      
Ntrans = 1000;

x0 = 0.2;

%% Iterate map
X = zeros(length(lambda), N-Ntrans);

for i = 1:length(lambda)
    x = x0;
    for n = 1:N
        x = lambda(i)*x*(1-x);
        if n > Ntrans
            X(i,n-Ntrans) = x;
        end
    end
end

%% Plot attracting orbits
figure; hold on; grid on
for i = 1:length(lambda)
    plot(lambda(i)*ones(1,N-Ntrans), X(i,:), '.k', 'MarkerSize', 1)
end

%% Fixed points
x0_fp = zeros(size(lambda));                 % x = 0
x1_fp = 1 - 1./lambda;                       % x = 1 - 1/lambda

%% Stability conditions
stable_x0   = lambda < 1;
unstable_x0 = lambda > 1;

stable_x1   = lambda > 1 & lambda < 3;
unstable_x1 = lambda < 1 | lambda > 3;

%% Plot x = 0
plot(lambda(stable_x0), x0_fp(stable_x0), 'b', 'LineWidth', 2)
plot(lambda(unstable_x0), x0_fp(unstable_x0), 'r--', 'LineWidth', 2)

%% Plot x = 1 - 1/lambda
plot(lambda(stable_x1), x1_fp(stable_x1), 'b', 'LineWidth', 2)
plot(lambda(unstable_x1), x1_fp(unstable_x1), 'r--', 'LineWidth', 2)

%% Formatting
xlabel('\lambda')
ylabel('x')
title('Bifurcation diagram of the logistic map')
axis([0 lambda_star 0 1])

legend('Attracting orbits', ...
       'Stable fixed points', ...
       'Unstable fixed points', ...
       'Location','northwest')
