clc
clear
close all
% Number of points and dimensional space
n = 10; % Total number of fixed points
k = 3;  % Dimensionality of the Euclidean space (3D)
m = 3;  % Number of groups
a_k = 1; % Constant related to the volume of the ball

% Fixed points coordinates
x_fixed = rand(k, n); % Random fixed points

% Define groups (example)
G = { [1, 2, 3], [4, 5], [6, 7, 8, 9, 10] }; 

% Decision variables: [x1, ..., xk, c1, r1, ..., cm, rm]
num_vars = k + m * (k + 1); % x1 to xk, centers, and radii
x0 = rand(num_vars, 1); % Initial guess

% Solve the problem with fmincon
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');
lb = [-Inf(k, 1); -Inf(m*k, 1); zeros(m, 1)]; % Radii must be non-negative
ub = []; % No upper bound constraints

[x_opt, fval] = fmincon(@(vars)objective(vars, k, m, a_k), x0, [], [], [], [], lb, ub, @(vars)constraints(vars, k, m, G, x_fixed), options);

% Display results
disp('Optimized point locations:');
disp(x_opt(1:k));

disp('Centers of the balls:');
centers = reshape(x_opt(k+1:k+m*k), k, m);
disp(centers);

disp('Radii of the balls:');
radii = x_opt(k+m*k+1:end);
disp(radii);

% Plot results in 3D
figure;
hold on;
grid on;
title('Optimized Covering Balls in 3D');
xlabel('X1');
ylabel('X2');
zlabel('X3');
axis equal;

% Plot fixed points
scatter3(x_fixed(1, :), x_fixed(2, :), x_fixed(3, :), 50, 'blue', 'filled', 'DisplayName', 'Fixed Points');

% Plot optimized balls
[theta, phi] = meshgrid(linspace(0, 2*pi, 50), linspace(0, pi, 50));
for i = 1:m
    % Sphere coordinates
    x_sphere = centers(1, i) + radii(i) * sin(phi) .* cos(theta);
    y_sphere = centers(2, i) + radii(i) * sin(phi) .* sin(theta);
    z_sphere = centers(3, i) + radii(i) * cos(phi);
    surf(x_sphere, y_sphere, z_sphere, 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'DisplayName', ['Ball ' num2str(i)]);
    scatter3(centers(1, i), centers(2, i), centers(3, i), 100, 'red', 'filled', 'DisplayName', ['Center ' num2str(i)]);
end

legend show;
hold off;

% Objective function
function obj = objective(vars, k, m, a_k)
    r = vars(k + m*k + 1:end); % Radii vector
    obj = sum(a_k * r.^k); % Sum of the volumes of balls
end

% Constraints function
function [c, ceq] = constraints(vars, k, m, G, x_fixed)
    x_vars = vars(1:k); % Optimizable x variables
    c_i = reshape(vars(k+1:k+m*k), k, m); % Centers of balls
    r = vars(k+m*k+1:end); % Radii of balls

    % Inequality constraints: every point must be inside the respective ball
    c = [];
    for i = 1:m
        for j = G{i}
            c = [c; norm(x_fixed(:,j) - c_i(:,i)) - r(i)];
        end
    end

    % Equality constraints: none in this problem
    ceq = [];
end
