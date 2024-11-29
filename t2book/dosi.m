% Parameters
t1 = 2; t2 = 2; % Traffic demands
c = 10; % Penalty parameter
max_iter = 8; % Number of iterations
step_size = 0.001; % Step size for gradient descent

% Initial primal variables (flows)
x1 = 0.5; x2 = 0.5; x3 = 0.5; x4 = 0.5;

% Initial dual variables (Lagrange multipliers)
mu1 = 0.0; mu2 = 0.0;
lambda1 = 0.0; lambda2 = 0.0; lambda3 = 0.0; lambda4 = 0.0;

% Initialize storage for plotting
x1_values = zeros(1, max_iter);
x2_values = zeros(1, max_iter);
x3_values = zeros(1, max_iter);
x4_values = zeros(1, max_iter);

lambda1_values = zeros(1, max_iter);
lambda2_values = zeros(1, max_iter);
lambda3_values = zeros(1, max_iter);
lambda4_values = zeros(1, max_iter);
mu1_values = zeros(1, max_iter);
mu2_values = zeros(1, max_iter);

% Gradient computation function
gradient = @(x1, x2, x3, x4, mu1, mu2, lambda1, lambda2, lambda3, lambda4) [
    2 / (2 - x1)^2 + mu1 + c * (x1 + x2 - t1) + lambda1 - max(0, lambda1 - c * x1) + lambda2 - max(0, lambda2 - c * x1);
    3 / (3 - x2 - x4)^2 + mu1 + c * (x1 + x2 - t1) + lambda3 - max(0, lambda3 - c * x2);
    2 / (2 - x1 - x3)^2 + mu2 + c * (x3 + x4 - t2) + lambda4 - max(0, lambda4 - c * x3);
    3 / (3 - x4)^2 + mu2 + c * (x3 + x4 - t2) + lambda3 - max(0, lambda3 - c * x4)
];

% Iterative optimization
for k = 1:max_iter
    % Store current values for plotting
    x1_values(k) = x1; x2_values(k) = x2; x3_values(k) = x3; x4_values(k) = x4;
    lambda1_values(k) = lambda1; lambda2_values(k) = lambda2;
    lambda3_values(k) = lambda3; lambda4_values(k) = lambda4;
    mu1_values(k) = mu1; mu2_values(k) = mu2;
    
    % Compute gradients
    grad = gradient(x1, x2, x3, x4, mu1, mu2, lambda1, lambda2, lambda3, lambda4);
    
    % Update primal variables using gradient descent
    x1 = x1 - step_size * grad(1);
    x2 = x2 - step_size * grad(2);
    x3 = x3 - step_size * grad(3);
    x4 = x4 - step_size * grad(4);
    
    % Update dual variables
    mu1 = mu1 + c * (x1 + x2 - t1);
    mu2 = mu2 + c * (x3 + x4 - t2);
    lambda1 = max(0, lambda1 - c * x1);
    lambda2 = max(0, lambda2 - c * x1);
    lambda3 = max(0, lambda3 - c * (x2 + x4));
    lambda4 = max(0, lambda4 - c * x3);
end

% Plotting
figure;

% Plot primal variables
subplot(1, 2, 1);
plot(0:max_iter-1, x1_values, 'o-', 'DisplayName', 'x^1'); hold on;
plot(0:max_iter-1, x2_values, 'o-', 'DisplayName', 'x^2');
plot(0:max_iter-1, x3_values, 'o-', 'DisplayName', 'x^3');
plot(0:max_iter-1, x4_values, 'o-', 'DisplayName', 'x^4');
xlabel('Iteration number (k)');
ylabel('Primal variables');
legend('show');
grid on;

% Plot dual variables
subplot(1, 2, 2);
plot(0:max_iter-1, lambda1_values, 'o-', 'DisplayName', '\lambda^1'); hold on;
plot(0:max_iter-1, lambda2_values, 'o-', 'DisplayName', '\lambda^2');
plot(0:max_iter-1, lambda3_values, 'o-', 'DisplayName', '\lambda^3');
plot(0:max_iter-1, lambda4_values, 'o-', 'DisplayName', '\lambda^4');
plot(0:max_iter-1, mu1_values, 'o-', 'DisplayName', '\mu^1');
plot(0:max_iter-1, mu2_values, 'o-', 'DisplayName', '\mu^2');
xlabel('Iteration number (k)');
ylabel('Dual variables');
legend('show');
grid on;

sgtitle('Primal and Dual Variable Evolution');
