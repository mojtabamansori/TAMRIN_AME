clc
clear
close all

A = 2 * ones(5, 5);
A(eye(5) == 1) = 0;

disp('figure 1')
disp(A);

disp('figure 2')
A(3,1) = 0;
A(1,3) = 0;
disp(A);
