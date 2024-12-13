clear
clc
%% first part
mat = magic(5);
A= mat;
val = 24;
index = find(A>val);
A(index) = A(index).^2;

fprintf("First Part ---> squar power of valuse wich greater than %d\n",val)
disp("Before")
disp(mat)
disp("After")
disp(A)
%% second part
% A(A>val)=0;
A(index) = 0;
fprintf("First Part ---> set to Zero the valuse wich greater than %d\n",val)
disp("Before")
disp(mat)
disp("After")
disp(A)
