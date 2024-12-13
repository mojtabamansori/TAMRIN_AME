clear
clc
%%

%                       X1 + 2𝑋2 + 3𝑋3 = 366
%  Solve  ------->     4𝑋1 + 5𝑋2 + 6𝑋3 = 804        
%                      7𝑋1 + 8𝑋2 = 351

%% Matices

% Ax = B
A = [1 1 3; 4 5 6; 7 8 0];
B = [366;804;351];
X1 = inv(A)*B;
valid1 = [X1(1)+ 2*X1(2) + 3*X1(3); 4*X1(1) + 5*X1(2) + 6*X1(3); 7*X1(1)+8*X1(2)];
disp("solve by matrices: X1")
disp(X1)
disp("comapre with  the orignal answers")
disp([valid1, B])
disp("*********************************************")

%% Symbolic
syms x1 x2 x3
equations = [x1+2*x2+3*x3-366; 4*x1+5*x2+6*x3-804; 7*x1+8*x2-351];
s=solve(equations);
X2 = double([s.x1;s.x2;s.x3]);
valid2 = [X2(1)+ 2*X2(2) + 3*X2(3); 4*X2(1) + 5*X2(2) + 6*X2(3); 7*X2(1)+8*X2(2)];
disp("solve by symbolic: X2")
disp(X2)
disp("comapre with  the orignal answers")
disp([valid2, B])
