clear
clc
%% 

A = rand(1,5)*8;
[r,c]=size(A);

MIN = inf;
for i=1:c
    if A(i)<MIN
        MIN = A(i);
    end
end

%% validation
disp("My Min:")
disp(MIN)
disp("Matlab Min:")
disp(min(A))