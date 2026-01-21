clear; clc; clf; tic;


x = linspace(-2,2,500);

mu1 = -6*x.^2;
lambda1 = 12*x.^2 + 3*x.^4;

mu2 = linspace(-5,2,500);
lambda2 = -2*mu2;

figure(1); hold on; grid on;
plot(lambda1,mu1,'k','LineWidth',2);
plot(lambda2,mu2,'r--','LineWidth',2);

xlabel('\lambda'); ylabel('\mu');
title('Bifurcation set');
legend('Saddle-node curve','x=0');

mu = -1;
lambda = linspace(-5,5,500);

x = linspace(-3,3,600);
[Lam,X] = meshgrid(lambda,x);
F = Lam + 2*mu + mu*X.^2 + 3*X.^4;

figure(2); hold on; grid on;
contour(Lam,X,F,[0 0],'k','LineWidth',2);
xlabel('\lambda'); ylabel('x');
title('Bifurcation diagram for \mu = -1');

x = linspace(-2,2,500);

mu = 4*x.^3;
lambda = 3*x.^4;

figure(3); 
plot(lambda,mu,'k','LineWidth',2);
grid on;
xlabel('\lambda'); ylabel('\mu');
title('Cusp bifurcation set');

mu = 1;
lambda = linspace(-2,4,500);
x = linspace(-2,2,600);

[Lam,X] = meshgrid(lambda,x);
F = Lam - mu*X + X.^4;

figure(4);
contour(Lam,X,F,[0 0],'k','LineWidth',2);
xlabel('\lambda'); ylabel('x'); grid on;
title('Bifurcation diagram for \mu = 1');

x = linspace(-2,0,500);
mu = 1;   % fix μ

lambda = 1./(x + mu).^2;

figure(5); 
plot(lambda,x,'k','LineWidth',2)

xlabel('\lambda'); ylabel('x');grid on;
title('Saddle-node bifurcation');

mu = 1;
lambda = linspace(0.1,5,500);
x = linspace(-20,20,800);

[Lam,X] = meshgrid(lambda,x);
F = 1./(X + Lam*mu) + Lam.*X - 2;

figure(6); 
contour(Lam,X,F,[0 0],'k','LineWidth',2);
xlabel('\lambda'); ylabel('x');grid on;
title('Bifurcation diagram for \mu = 1');