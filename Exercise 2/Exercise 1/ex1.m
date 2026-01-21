clear; clc; clf; tic;

lambda = linspace(0,2,400);

x1 = (lambda/2).^(1/4);
x2 = -x1;

figure(1); clf; hold on; grid on;
plot(lambda, x1,'b','LineWidth',2);
plot(lambda, x2,'b','LineWidth',2);
plot(lambda, zeros(size(lambda)),'r--','LineWidth',1.5);

xlabel('$\lambda$', 'Interpreter','latex');
ylabel('$x^*$', 'Interpreter','latex');
title('Bifurcation diagram: $\dot{x} = \lambda x^2 - 2x^6$', 'Interpreter','latex');
legend('Stable','Stable','Unstable', 'Interpreter','latex');


a = 1;
lambda = linspace(-2,2,400);

x_plus  = (a*lambda + abs(lambda)*sqrt(a^2+3))/3;
x_minus = (a*lambda - abs(lambda)*sqrt(a^2+3))/3;

figure(2); clf; hold on; grid on;
plot(lambda, x_plus,'b','LineWidth',2);
plot(lambda, x_minus,'r--','LineWidth',2);

xlabel('$\lambda$', 'Interpreter','latex');
ylabel('$x^*$', 'Interpreter','latex');
title('Saddle-node bifurcation', 'Interpreter','latex');
legend('Stable','Unstable', 'Interpreter','latex');


lambda = linspace(-1.99,-0.01,400);
x = sqrt(-lambda./(lambda+2));

figure(3); clf; hold on; grid on;
plot(lambda, x,'b','LineWidth',2)
plot(lambda,-x,'b','LineWidth',2)
plot([-2 0],[0 0],'r--','LineWidth',1.5)

xlabel('$\lambda$', 'Interpreter','latex');
ylabel('$x^*$', 'Interpreter','latex');
title('Restricted pitchfork bifurcation', 'Interpreter','latex');
legend('Stable','Stable','$x=0$', 'Interpreter','latex');


x = linspace(-2,2,500);
lambda = (3/2)*x.^2;

figure(4); clf; hold on; grid on;
plot(lambda,x,'k','LineWidth',2);

xlabel('$\lambda$', 'Interpreter','latex');
ylabel('$x^*$', 'Interpreter','latex');
title('Cusp bifurcation','Interpreter','latex');