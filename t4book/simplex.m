%example 3.6
clc
clear
close all

c = [1 2 3 0 0];
A = [1 2 1 1 0;
     1 1 0 0 1];
b = [1; 1];

[num_constraints, num_variables] = size(A);

tableau = [A eye(num_constraints) b; 
           c zeros(1, num_constraints) 0];

disp('Initial Simplex Tableau:');
disp(tableau);

iteration = 1;
while any(tableau(end, 1:num_variables) < 0)
    fprintf('Iteration %d:\n', iteration);
    
    [~, pivot_col] = min(tableau(end, 1:num_variables));
    fprintf('Pivot Column: %d\n', pivot_col);
    
    ratios = tableau(1:num_constraints, end) ./ tableau(1:num_constraints, pivot_col);
    ratios(ratios <= 0) = inf;
    [~, pivot_row] = min(ratios);
    fprintf('Pivot Row: %d\n', pivot_row);
    
    tableau(pivot_row, :) = tableau(pivot_row, :) / tableau(pivot_row, pivot_col);
    
    for i = 1:size(tableau, 1)
        if i ~= pivot_row
            tableau(i, :) = tableau(i, :) - tableau(i, pivot_col) * tableau(pivot_row, :);
        end
    end
    
    disp('Updated Tableau:');
    disp(tableau);
    
    iteration = iteration + 1;
end

disp('Final Simplex Tableau:');
disp(tableau);

solution = zeros(num_variables, 1);
for i = 1:num_variables
    col = tableau(1:num_constraints, i);
    if sum(col == 1) == 1 && sum(col == 0) == num_constraints - 1
        solution(i) = tableau(find(col == 1), end);
    end
end

disp('Optimal Variable Values:');
disp(solution);

disp('Optimal Objective Function Value:');
disp(-tableau(end, end));

%example 3.3

c = [-2 -1 0 0 0];
A = [1 0 1 0 0;
     0 1 0 1 0;
     1 1 0 0 1];
b = [3; 2; 4];

[num_constraints, num_variables] = size(A);
tableau = [A eye(num_constraints) b; 
           c zeros(1, num_constraints) 0];

disp('Initial Simplex Tableau:');
disp(tableau);
heatmap(tableau, 'Title', 'Initial Simplex Tableau', 'CellLabelColor', 'none');
pause(1);

iteration = 1;
while any(tableau(end, 1:num_variables) < 0)
    fprintf('Iteration %d:\n', iteration);
    [~, pivot_col] = min(tableau(end, 1:num_variables));
    fprintf('Pivot Column: %d\n', pivot_col);
    ratios = tableau(1:num_constraints, end) ./ tableau(1:num_constraints, pivot_col);
    ratios(ratios <= 0) = inf;
    [~, pivot_row] = min(ratios);
    fprintf('Pivot Row: %d\n', pivot_row);
    tableau(pivot_row, :) = tableau(pivot_row, :) / tableau(pivot_row, pivot_col);
    for i = 1:size(tableau, 1)
        if i ~= pivot_row
            tableau(i, :) = tableau(i, :) - tableau(i, pivot_col) * tableau(pivot_row, :);
        end
    end
    disp('Updated Tableau:');
    disp(tableau);
    heatmap(tableau, 'Title', sprintf('Simplex Tableau - Iteration %d', iteration), 'CellLabelColor', 'none');
    pause(1);
    iteration = iteration + 1;
end

disp('Final Simplex Tableau:');
disp(tableau);
heatmap(tableau, 'Title', 'Final Simplex Tableau', 'CellLabelColor', 'none');
pause(1);

solution = zeros(num_variables, 1);
for i = 1:num_variables
    col = tableau(1:num_constraints, i);
    if sum(col == 1) == 1 && sum(col == 0) == num_constraints - 1
        solution(i) = tableau(find(col == 1), end);
    end
end
disp('Optimal Variable Values:');
disp(solution);
disp('Optimal Objective Function Value:');
disp(-tableau(end, end));


