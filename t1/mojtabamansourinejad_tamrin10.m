clc;
clear;

% Define the x range
x = 0.01:0.01:10;  % Avoid 0 for logarithm

% Calculate functions
y_exp = exp(x);            % Exponential function
y_log = log(x);            % Logarithmic function
y_sin = sin(x);            % Sine function
y_cos = cos(x);            % Cosine function

% Create subplots
figure;

% Subplot 1: Exponential function
subplot(2, 2, 1);
plot(x, y_exp, 'b-', 'LineWidth', 2);
grid on; 
xlabel('x');
ylabel('exp(x)');
title('Exponential Function');

% Subplot 2: Logarithmic function
subplot(2, 2, 2);
plot(x, y_log, 'r-', 'LineWidth', 2);
grid on; 
xlabel('x');
ylabel('log(x)');
title('Logarithmic Function');

% Subplot 3: Sine function
subplot(2, 2, 3);
plot(x, y_sin, 'g-', 'LineWidth', 2);
grid on; 
xlabel('x');
ylabel('sin(x)');
title('Sine Function');

% Subplot 4: Cosine function
subplot(2, 2, 4);
plot(x, y_cos, 'm-', 'LineWidth', 2);
grid on; 
xlabel('x');
ylabel('cos(x)');
title('Cosine Function');

% Adjust layout
sgtitle('Different Functions');
