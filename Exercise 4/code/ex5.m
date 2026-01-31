%% Newton method: error convergence
% g(x) = x^2 - 4

clear; clc; close all;

%% Newton map
f = @(x) 0.5*(x + 4./x);

%% Exact solution
x_exact = 2;

%% Iteration
N = 8;
x = zeros(N+1,1);
x(1) = 1;

for n = 1:N
    x(n+1) = f(x(n));
end

%% Error
err = abs(x - x_exact);

%% Plot error
figure; hold on; grid on
semilogy(0:N, err, 'bo-', 'LineWidth', 2, 'MarkerFaceColor','b')

xlabel('Iteration n')
ylabel('|x_n - x^*|')
title('Error convergence of Newton method')
