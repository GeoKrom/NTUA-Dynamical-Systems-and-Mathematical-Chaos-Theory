clear all;
close all;
clc;

e = 1e-4;
odefun = @(t, x) [x(1) - x(1).^3; 0; 0; 1];
plotpp(odefun,'tspan', 100, 'xLim', [-5,5], 'yLim', [-5,5],...
                      'quivercolor', [0.6,0.6,0.6],...
                      'linecolor', [0.3,0.3,0.3])
xlabel('$x$','FontSize',14,'Interpreter','latex');
ylabel('$y$','FontSize',14,'Interpreter','latex');