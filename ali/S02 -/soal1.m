clear
clc
%% 
disp("calcuation of Factorial")
x = input('Enter number:');

fact = 1;
while x
    fact = fact*x;
    x = x-1;
end

fprintf("fatcorial = %d\n",fact);