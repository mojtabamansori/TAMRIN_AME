clear
clc
%%
disp("Enter the number of Rows and Columns")
row = input('Rows:');
col = input('Columns:');

A = ones(row,col)*row;
disp(A)