result = even_numbers_matrix(80, 500);
disp(result);


function matrix = even_numbers_matrix(start_num, end_num, cols)
    
    if nargin < 10
        cols = 10;
    end
    
 
    even_numbers = start_num:2:end_num;
    if mod(start_num, 2) ~= 0
        even_numbers = start_num + 1:2:end_num;
    end
    

    rows = ceil(length(even_numbers) / cols);
    

    matrix = zeros(rows, cols);
    for i = 1:length(even_numbers)
        row = ceil(i / cols);
        col = mod(i - 1, cols) + 1;
        matrix(row, col) = even_numbers(i);
    end
end
