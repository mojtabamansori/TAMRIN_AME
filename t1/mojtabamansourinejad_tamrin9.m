clc;
clear;

% Create variable x
x = -3:0.01:10; 

% Calculate signals
y1 = x.^2 .* sin(pi ./ x);  
y2 = 2 * cos(1 + x);        
y_combined = y1 + y2;       

% Create subplots
figure;

% Set default font
set(0, 'DefaultTextFontName', 'Arial', 'DefaultAxesFontName', 'Arial', 'DefaultTextFontSize', 12, 'DefaultAxesFontSize', 12);

% Subplot 1
subplot(3, 1, 1);
plot(x, y1, 'b-', 'LineWidth', 2);
grid on; 
xlabel('x'); 
ylabel('y1 = x^2 * sin(\pi/x)'); 
title('Signal 1');
set(gca, 'FontSize', 12);
axis tight;

% Subplot 2
subplot(3, 1, 2);
plot(x, y2, 'r-', 'LineWidth', 2);
grid on; 
xlabel('x'); 
ylabel('y2 = 2 * cos(x + 1)'); 
title('Signal 2');
set(gca, 'FontSize', 12);
axis tight;

% Subplot 3 (combined signals)
subplot(3, 1, 3);
plot(x, y_combined, 'g-', 'LineWidth', 2);
grid on; 
xlabel('x'); 
ylabel('y_{combined}'); 
title('Combined Signals');
set(gca, 'FontSize', 12);
axis tight;

% Adjust layout
sgtitle('Improved Signal Plots', 'FontSize', 14, 'FontWeight', 'bold');
