

function simulated_annealing_complex()
    % Initial settings
    n_vars = 10;      % Number of variables
    max_iter = 1000;  % Maximum number of iterations
    T_init = 100;     % Initial temperature
    T_min = 1e-3;     % Minimum temperature
    alpha = 0.9;      % Cooling rate

    % Variable range
    var_range = [-5.12, 5.12];

    % Initialization
    x = rand_range(var_range, n_vars);
    best_solution = x;
    best_cost = objective_function(x);

    T = T_init; % Initial temperature

    % Arrays for plotting
    temperatures = zeros(1, max_iter);
    costs = zeros(1, max_iter);
    solutions = zeros(max_iter, n_vars);

    % Main loop
    for iter = 1:max_iter
        % Generate new neighbor
        new_x = x + randn(1, n_vars) * T;
        
        % Check bounds
        new_x = max(min(new_x, var_range(2)), var_range(1));

        % Calculate new cost
        new_cost = objective_function(new_x);

        % Cost difference
        delta = new_cost - best_cost;

        % Accept new solution
        if delta < 0 || rand < exp(-delta / T)
            x = new_x;
            best_solution = new_x;
            best_cost = new_cost;
        end

        % Store the data for plotting
        temperatures(iter) = T;
        costs(iter) = best_cost;
        solutions(iter, :) = best_solution;

        % Decrease temperature
        T = T * alpha;

        % Stopping condition for temperature
        if T < T_min
            break;
        end
    end

    % Display results
    fprintf('Best Solution Found:\n');
    disp(best_solution);
    fprintf('Best Cost: %.4f\n', best_cost);

    % Create subplots with improved graphics
    figure('Color', [1 1 1]);

    % Temperature vs Iterations plot
    subplot(2, 2, 1);
    plot(1:iter, temperatures(1:iter), '-s', 'MarkerFaceColor', '#1f77b4', 'MarkerEdgeColor', '#1f77b4', 'LineWidth', 2, 'MarkerSize', 6);
    title('Temperature vs Iterations', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Iteration', 'FontSize', 12);
    ylabel('Temperature', 'FontSize', 12);
    grid on;
    set(gca, 'FontSize', 12);

    % Best Cost vs Iterations plot
    subplot(2, 2, 2);
    plot(1:iter, costs(1:iter), '-o', 'MarkerFaceColor', '#ff7f0e', 'MarkerEdgeColor', '#ff7f0e', 'LineWidth', 2, 'MarkerSize', 6);
    title('Best Cost vs Iterations', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Iteration', 'FontSize', 12);
    ylabel('Best Cost', 'FontSize', 12);
    grid on;
    set(gca, 'FontSize', 12);

    % Solution Progress in Space plot (3D)
    subplot(2, 2, 3);
    plot3(solutions(1:iter, 1), solutions(1:iter, 2), costs(1:iter), '-^', 'MarkerFaceColor', '#2ca02c', 'MarkerEdgeColor', '#2ca02c', 'LineWidth', 2, 'MarkerSize', 6);
    title('Solution Progress in Space', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('X1', 'FontSize', 12);
    ylabel('X2', 'FontSize', 12);
    zlabel('Cost', 'FontSize', 12);
    grid on;
    set(gca, 'FontSize', 12);

    % Convergence vs Iterations plot
    subplot(2, 2, 4);
    plot(1:iter, costs(1:iter) - min(costs(1:iter)), '-d', 'MarkerFaceColor', '#9467bd', 'MarkerEdgeColor', '#9467bd', 'LineWidth', 2, 'MarkerSize', 6);
    title('Convergence vs Iterations', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Iteration', 'FontSize', 12);
    ylabel('Normalized Cost', 'FontSize', 12);
    grid on;
    set(gca, 'FontSize', 12);

end

% Objective function (Rastrigin Function)
function cost = objective_function(x)
    cost = sum(x.^2 - 10 * cos(2 * pi * x) + 10);
end

% Function to generate random values within a specified range
function val = rand_range(range, n)
    val = range(1) + (range(2) - range(1)) * rand(1, n);
end
