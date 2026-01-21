clear; clc; clf; tic;

mu = linspace(-4,4,600);
lambda = -mu.^2/4;

figure; grid on; hold on;
plot(lambda,mu,'k','LineWidth',2);

xlabel('\lambda');
ylabel('\mu');
title('Bifurcation curve \lambda = -\mu^2/4');


lambda = 1;
mu = 1;

f = @(t,z) [
    -2*z(2) + z(1)*(lambda + 2*mu*sqrt(z(1)^2+z(2)^2) - (z(1)^2+z(2)^2));
     z(1)   + z(2)*(3*lambda + mu*sqrt(z(1)^2+z(2)^2) - (z(1)^2+z(2)^2))
];

[x,y] = meshgrid(linspace(-3,3,20));
u = zeros(size(x)); v = zeros(size(y));

for i=1:numel(x)
    z = f(0,[x(i);y(i)]);
    u(i)=z(1); v(i)=z(2);
end

figure; hold on; grid on;
quiver(x,y,u,v,'k');
axis equal;
title('Phase portrait (\lambda=1,\mu=1)');