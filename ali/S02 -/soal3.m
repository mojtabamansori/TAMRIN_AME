clear
clc
%% 
A = magic(3);
[r,c] = size(A);

result = [];
for i = 1:r
    for j = 1:5
        if i==j
            result = [result;A(i,j)];
        end
    end
end

disp(A)

disp("Main Diagonal ")
disp(result)