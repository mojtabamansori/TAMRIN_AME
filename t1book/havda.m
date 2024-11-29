% Objective function and its gradient
f = @(x) (x(1) - 4)^2 + 10*(x(2) - 4)^2;
grad_f = @(x) [2*(x(1) - 4); 20*(x(2) - 4)];

% Initialization
x0 = [0; 0];  % Starting point
tol = 1e-3;   % Tolerance for convergence
max_iter = 1000; % Maximum number of iterations
step_sizes = [0.1, 0.01]; % Step sizes to compare

% Prepare for plotting
figure;
for i = 1:2
    s = step_sizes(i);
    x = x0;
    iter = 0;
    x_history = x;

    % Steepest descent iterations
    while true
        grad = grad_f(x);
        x_new = x - s * grad;
        iter = iter + 1;
        x_history = [x_history, x_new]; %#ok<AGROW>

        % Check for convergence
        if norm(x_new - x) < tol || iter >= max_iter
            break;
        end

        x = x_new;
    end

    % Plot the contour and trajectory
    subplot(1, 2, i);
    hold on;
    [X1, X2] = meshgrid(-2:0.1:10, -2:0.1:10);
    F = (X1 - 4).^2 + 10*(X2 - 4).^2;
    contour(X1, X2, F, 20); % Contour plot of the function
    plot(x_history(1, :), x_history(2, :), '-o', 'LineWidth', 1);
    plot(4, 4, 'r*', 'MarkerSize', 10); % Mark the optimal point
    title(['s = ', num2str(s), ', Iterations: ', num2str(iter)]);
    xlabel('x_1');
    ylabel('x_2');
    axis equal;
    grid on;
end