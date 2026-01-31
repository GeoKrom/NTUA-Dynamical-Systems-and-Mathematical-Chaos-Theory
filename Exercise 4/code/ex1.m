%% Phase portrait with colored regions dy/dx sign
% x' = -x + y
% y' = 4x^2/(1+3x^2) - y

clear; clc; close all;

%% Grid
[x,y] = meshgrid(linspace(-0.5,1.5,200));

%% Vector field
X = -x + y;
Y = 4*x.^2./(1+3*x.^2) - y;

%% dy/dx sign
slope = Y ./ X;

%% Coloring regions
figure; hold on; grid on

% dy/dx > 0  (same sign)
pos = slope > 0;
neg = slope < 0;

contourf(x,y,pos,[1 1],'FaceColor',[0.85 0.92 1],'LineStyle','none')
contourf(x,y,neg,[1 1],'FaceColor',[1 0.9 0.9],'LineStyle','none')

%% Vector field (downsampled for clarity)
[xq,yq] = meshgrid(linspace(-0.5,1.5,25));
dx = -xq + yq;
dy = 4*xq.^2./(1+3*xq.^2) - yq;
quiver(xq,yq,dx,dy,'k')

%% Isoclines
xx = linspace(-0.5,1.5,400);

% X(x,y)=0 -> y=x
plot(xx,xx,'r','LineWidth',2)

% Y(x,y)=0 -> y=4x^2/(1+3x^2)
plot(xx,4*xx.^2./(1+3*xx.^2),'b','LineWidth',2)

%% Equilibria
eq = [0 0; 1/3 1/3; 1 1];
plot(eq(:,1),eq(:,2),'ko','MarkerFaceColor','k')

%% Trajectories
f = @(t,z)[-z(1)+z(2); 4*z(1)^2/(1+3*z(1)^2)-z(2)];
tspan = [0 20];

IC = [
    0.1 0.4;
    0.4 0.1;
    0.8 0.5;
    1.2 0.9;
    0.6 0.9
];

for i=1:size(IC,1)
    [t,z] = ode45(f,tspan,IC(i,:));
    plot(z(:,1),z(:,2),'k','LineWidth',1.5)
end

%% Formatting
axis equal
axis([-0.5 1.5 -0.2 1.5])
xlabel('x')
ylabel('y')
title('Phase portrait with isoclines and regions of dy/dx sign')

%% Legend (manual explanation)
text(-0.45,1.35,'Blue: dy/dx > 0','Color','b','FontSize',10)
text(-0.45,1.25,'Red: dy/dx < 0','Color','r','FontSize',10)
