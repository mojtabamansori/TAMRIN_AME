clear
clc
%%
% Create a grid of x and y values
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);

% Define a function to generate z values (you can replace this with your own function)
z = x.^2 + y.^2;

% Create a contour plot
contour(x, y, z);

% Add labels and title
xlabel('X-axis');
ylabel('Y-axis');
title('Contour Plot Example');

% Add a colorbar for reference
colorbar;
