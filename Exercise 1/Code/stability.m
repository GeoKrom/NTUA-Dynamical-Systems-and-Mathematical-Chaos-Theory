%% Stability Analysis Exable
% Assignment 1 - Exercise 3
%       Name: George Krommydas
%       A.M.: 02121208

clc;
clear;
close all;
syms z y k l


%% Dynamical System
h = .01;
x = -2.5:h:2.5;
x_dot = x.*(x.^2-1).*(x.^2-4);

y = zeros(size(x));

y0 = 0;
y(1) = y0;
for i = 1:length(x)-1
    y(i+1) = y(i) + h.*x_dot(i);
end
% Plot
figure(1);
clf;
plot(x, x_dot,'r-');
hold on;
plot(x, zeros(size(x)),'b--');
plot(0,0,'ko','LineWidth',1);
plot(1,0,'ko','LineWidth',1);
plot(-1,0,'ko','LineWidth',1);
plot(2,0,'ko','LineWidth',1);
plot(-2,0,'ko','LineWidth',1);
hold off;
axis equal;
grid minor;
xlabel("$x$","Interpreter","latex","FontSize",16);
ylabel("$\dot{x}$","Interpreter","latex","FontSize",16);
ylim([-7 5]);
xlim([-3 3]);

figure(2);
clf;
plot(x,y,'r-');
hold on;
axis equal;
grid minor;
xlabel("$x$","Interpreter","latex","FontSize",16);
ylabel("$y(x)$","Interpreter","latex","FontSize",16);
% ylim([0 20]);
% xlim([-2.5 2.5]);