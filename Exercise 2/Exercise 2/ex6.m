%% Bifurcation curve near the origin
% lambda = 0

clear; clc; close all;

% Small neighborhood of the origin in parameter space
mu = linspace(-1,1,400);
lambda = zeros(size(mu));

figure; hold on; grid on
plot(lambda, mu, 'k', 'LineWidth', 2)

xlabel('\lambda')
ylabel('\mu')
title('Bifurcation curve near the origin')
axis equal
axis([-0.5 0.5 -0.5 0.5])

% Mark the origin
plot(0,0,'ro','MarkerFaceColor','r')