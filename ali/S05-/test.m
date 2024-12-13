clear
clc
close
%% Function
syms x1 x2 mue c
f(x1,x2,mue,c) = 0.5 * (x1^2 + x2^2) + mue*(x1-1) + (c/2)*(x1-1)^2;
NumVar = 2; % number of variables

%% Descent method with stepsize = 0.01;
step = 1E-2;
Fs = 1E-3;
MaxIter = 160;

grad = [diff(f,x1);diff(f,x2)];
D = eye(NumVar,NumVar);

% start pionts
n = [0;0];
u = -0.5;
C = 10;

points1 = n;
iter = 0;
while f(n(1),n(2),u,C) > Fs && iter < MaxIter
    n = double(n - step*D*grad(n(1),n(2),u,C));
    points1 = [points1,n];
    iter = iter+1;
end


disp(n)

%%