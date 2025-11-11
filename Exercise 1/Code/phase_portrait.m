clear all;
close all;
clc;


odefun = @(t, x) [7*x(1) + 10*x(2) + 3; -5*x(1) - 7*x(2) + 1];
plotpp(odefun,'tspan', 100, 'xLim', [-10,50], 'yLim', [-50,10],...
                      'quivercolor', [0.6,0.6,0.6],...
                      'linecolor', [0.3,0.3,0.3])
xlabel('$x$','FontSize',14,'Interpreter','latex');
ylabel('$y$','FontSize',14,'Interpreter','latex');