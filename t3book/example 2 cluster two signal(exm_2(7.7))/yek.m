clc;
clear;
close all;

% Input Data
% Define C1 (polyhedron): C * x <= d
C = [1, 0; 0, 1; -1, 0; 0, -1];  % Coefficients of inequalities for polyhedron
d = [2; 2; 0; 0];                % Right-hand side of inequalities

% Define C2 (ellipsoid): Pu + q, with ||u||_2 <= 1
P = [1, 0; 0, 1];                % Ellipsoid transformation matrix (unit circle)
q = [3; 1];                      % Ellipsoid center

% Initialize Variables
n = size(C, 2);                  % Dimension of the problem
a = randn(n, 1);                 % Random initial normal vector
a = a / norm(a);                 % Normalize a

% Hyperparameters
max_iters = 100;                 % Maximum iterations for optimization
tol = 1e-6;                      % Tolerance for convergence

% Visualization setup
figure;
hold on;
axis equal;
grid on;
xlabel('x1');
ylabel('x2');
title('Thickest Slab Separating C1 and C2');
xlim([-1, 5]);
ylim([-1, 3]);

% Plot C1 (polyhedron)
x_poly = [-1, 2]; % Range of x-coordinates
y_poly1 = [2, 2]; % Top boundary
y_poly2 = [0, 0]; % Bottom boundary
fill([0 2 2 0], [0 0 2 2], 'r', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
text(1, 1, 'C1');

% Plot C2 (ellipsoid)
theta = linspace(0, 2*pi, 100); % Angles for sampling
ellipse_points = P * [cos(theta); sin(theta)] + q;
plot(ellipse_points(1, :), ellipse_points(2, :), 'b', 'LineWidth', 1.5);
text(q(1), q(2), 'C2');

% Optimization Loop
for iter = 1:max_iters
    % Step 1: Compute inf_x∈C1 (a^T * x)
    inf_C1 = Inf;
    for i = 1:size(C, 1)
        ci = C(i, :)';
        di = d(i);
        xi = (di / (ci' * a)) * a;  % Solve for x on the boundary of C1
        if ci' * xi <= di  % Ensure x satisfies constraints
            value = a' * xi;  % Evaluate objective
            if value < inf_C1
                inf_C1 = value;
            end
        end
    end

    % Step 2: Compute sup_x∈C2 (a^T * x)
    sup_C2 = -Inf;
    for u = theta
        ui = [cos(u); sin(u)];  % Generate points on unit circle
        x = P * ui + q;         % Transform u to ellipsoid
        value = a' * x;         % Evaluate objective
        if value > sup_C2
            sup_C2 = value;
        end
    end

    % Step 3: Maximize slab thickness
    thickness = inf_C1 - sup_C2;

    % Step 4: Update a using gradient ascent
    grad = inf_C1 - sup_C2;  % Approximate gradient
    a = a + 0.1 * grad * a;  % Update rule with step size
    a = a / norm(a);         % Normalize a

    % Convergence Check
    if abs(thickness - (inf_C1 - sup_C2)) < tol
        break;
    end

    % Visualization: Plot the separating hyperplanes
    b = 0.5 * (inf_C1 + sup_C2); % Center of the slab
    x_vals = linspace(-1, 5, 100);
    hyperplane = b ./ (a(1) + 1e-6) - (a(2) ./ (a(1) + 1e-6)) * x_vals; % Hyperplane equation
    plot(x_vals, hyperplane, 'k--', 'LineWidth', 1.2); % Slab centerline
    pause(0.1);
end

% Final Output Results
disp('Optimal Normal Vector (a):');
disp(a);
disp('Maximum Slab Thickness:');
disp(thickness);

% Final visualization of the slab
b = 0.5 * (inf_C1 + sup_C2); % Center of the slab
x_vals = linspace(-1, 5, 100);
centerline = b ./ (a(1) + 1e-6) - (a(2) ./ (a(1) + 1e-6)) * x_vals;
upper_boundary = (inf_C1 ./ (a(1) + 1e-6)) - (a(2) ./ (a(1) + 1e-6)) * x_vals;
lower_boundary = (sup_C2 ./ (a(1) + 1e-6)) - (a(2) ./ (a(1) + 1e-6)) * x_vals;

plot(x_vals, centerline, 'g-', 'LineWidth', 2); % Final centerline
plot(x_vals, upper_boundary, 'm-', 'LineWidth', 2); % Upper boundary
plot(x_vals, lower_boundary, 'm-', 'LineWidth', 2); % Lower boundary
legend('C1 (Polyhedron)', 'C2 (Ellipsoid)', 'Iterative Hyperplanes', 'Final Centerline', 'Final Slab Boundaries');
hold off;

% Save the figure
saveas(gcf, 'Thickest_Slab_Separation.png');
disp('Figure saved as "Thickest_Slab_Separation.png".');
