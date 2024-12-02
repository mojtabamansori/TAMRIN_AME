t1 = 2; t2 = 2;
c = 10;
maxiter = 8;
stepsize = 0.001;

x1 = 0.5; x2 = 0.5; x3 = 0.5; x4 = 0.5;
mu1 = 0.0; mu2 = 0.0;
lambda1 = 0.0; lambda2 = 0.0; lambda3 = 0.0; lambda4 = 0.0;

x1vals = zeros(1, maxiter);
x2vals = zeros(1, maxiter);
x3vals = zeros(1, maxiter);
x4vals = zeros(1, maxiter);

lambda1vals = zeros(1, maxiter);
lambda2vals = zeros(1, maxiter);
lambda3vals = zeros(1, maxiter);
lambda4vals = zeros(1, maxiter);
mu1vals = zeros(1, maxiter);
mu2vals = zeros(1, maxiter);

grad = @(x1, x2, x3, x4, mu1, mu2, lambda1, lambda2, lambda3, lambda4) [
    2 / (2 - x1)^2 + mu1 + c * (x1 + x2 - t1) + lambda1 - max(0, lambda1 - c * x1) + lambda2 - max(0, lambda2 - c * x1);
    3 / (3 - x2 - x4)^2 + mu1 + c * (x1 + x2 - t1) + lambda3 - max(0, lambda3 - c * x2);
    2 / (2 - x1 - x3)^2 + mu2 + c * (x3 + x4 - t2) + lambda4 - max(0, lambda4 - c * x3);
    3 / (3 - x4)^2 + mu2 + c * (x3 + x4 - t2) + lambda3 - max(0, lambda3 - c * x4)
];

for k = 1:maxiter
    x1vals(k) = x1; x2vals(k) = x2; x3vals(k) = x3; x4vals(k) = x4;
    lambda1vals(k) = lambda1; lambda2vals(k) = lambda2;
    lambda3vals(k) = lambda3; lambda4vals(k) = lambda4;
    mu1vals(k) = mu1; mu2vals(k) = mu2;

    g = grad(x1, x2, x3, x4, mu1, mu2, lambda1, lambda2, lambda3, lambda4);

    x1 = x1 - stepsize * g(1);
    x2 = x2 - stepsize * g(2);
    x3 = x3 - stepsize * g(3);
    x4 = x4 - stepsize * g(4);

    mu1 = mu1 + c * (x1 + x2 - t1);
    mu2 = mu2 + c * (x3 + x4 - t2);
    lambda1 = max(0, lambda1 - c * x1);
    lambda2 = max(0, lambda2 - c * x1);
    lambda3 = max(0, lambda3 - c * (x2 + x4));
    lambda4 = max(0, lambda4 - c * x3);
end

figure;
subplot(1, 2, 1);
plot(0:maxiter-1, x1vals, 'o-', 'DisplayName', 'x^1'); hold on;
plot(0:maxiter-1, x2vals, 'o-', 'DisplayName', 'x^2');
plot(0:maxiter-1, x3vals, 'o-', 'DisplayName', 'x^3');
plot(0:maxiter-1, x4vals, 'o-', 'DisplayName', 'x^4');
xlabel('Iteration (k)');
ylabel('Primal variables');
legend('show');
grid on;

subplot(1, 2, 2);
plot(0:maxiter-1, lambda1vals, 'o-', 'DisplayName', '\lambda^1'); hold on;
plot(0:maxiter-1, lambda2vals, 'o-', 'DisplayName', '\lambda^2');
plot(0:maxiter-1, lambda3vals, 'o-', 'DisplayName', '\lambda^3');
plot(0:maxiter-1, lambda4vals, 'o-', 'DisplayName', '\lambda^4');
plot(0:maxiter-1, mu1vals, 'o-', 'DisplayName', '\mu^1');
plot(0:maxiter-1, mu2vals, 'o-', 'DisplayName', '\mu^2');
xlabel('Iteration (k)');
ylabel('Dual variables');
legend('show');
grid on;

sgtitle('Evolution of Primal and Dual Variables');
