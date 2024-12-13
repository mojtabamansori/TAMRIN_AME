clear
clc
% Objective function to maximize (replace this with your own function)
objective_function = @(x) -x^2 + 10*x;

% Simulated Annealing parameters
initial_solution = randi([0, 10]); % Initial random solution
temperature = 100; % Initial temperature
cooling_rate = 0.95; % Cooling rate
iterations_per_temperature = 50;

% Simulated Annealing algorithm
current_solution = initial_solution;
current_value = objective_function(current_solution);

while temperature > 1
    for i = 1:iterations_per_temperature
        % Generate a neighboring solution (random change)
        neighbor_solution = current_solution + randi([-1, 1]);
        
        % Ensure the neighbor is within bounds (replace with your own constraints)
        neighbor_solution = max(0, min(10, neighbor_solution));
        
        % Evaluate the objective function for the neighbor
        neighbor_value = objective_function(neighbor_solution);
        
        % Accept the neighbor solution with a probability determined by the
        % Metropolis criterion
        if neighbor_value > current_value || rand() < exp((neighbor_value - current_value) / temperature)
            current_solution = neighbor_solution;
            current_value = neighbor_value;
        end
    end
    
    % Cool down the temperature
    temperature = temperature * cooling_rate;
end

disp('Optimal Solution:');
disp(current_solution);
disp('Optimal Objective Value:');
disp(current_value);
