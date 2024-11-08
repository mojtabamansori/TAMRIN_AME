clc;
clear;
close all;

A = randi([0, 10], 5, 5);

disp('org matrix:')
disp(A);

idx = A > 4;

A_squared = A;
A_squared(idx) = A(idx).^2;

disp('sal alf:')
disp(A_squared);

A_zeroed = A;
A_zeroed(idx) = 0;

disp('sal be:')
disp(A_zeroed);
