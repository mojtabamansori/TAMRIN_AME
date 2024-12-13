clear
clc
%% figure 1
x = ones(5)*2;
x(logical(eye(5)))=0;
disp("figure 1")
disp(x)

%% figure 1
y = ones(5)*2;
[r,c] = size(y);
y(logical(eye(5)))=0;
y(round(r/2),:) = 0;
y(:,round(c/2)) = 0;

disp("figure 2")
disp(y)
