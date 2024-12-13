clear
clc
close
%% Function
syms x1 x2
f(x1,x2) = (x1-4)^2 + 10*(x2-4)^2;
NumVar = 2; % number of variables

%% Descent method with stepsize = 0.01;
step = 1E-2;
Fs = 1E-3;
MaxIter = 160;

grad = [diff(f,x1);diff(f,x2)];
D = eye(NumVar,NumVar);

n = [0;0]; % start piont

points1 = n;
iter = 0;
while f(n(1),n(2)) > Fs && iter < MaxIter
    n = double(n - step*D*grad(n(1),n(2)));
    disp(n)
    points1 = [points1,n];
    iter = iter+1;
end

%% Descent method with stepsize = 0.1;
step = 1E-1;
Fs = 1E-3;
MaxIter = 20;

grad = [diff(f,x1);diff(f,x2)];
D = eye(NumVar,NumVar);

n = [0;0]; % start piont

points2 = n;
iter = 0;
while f(n(1),n(2)) > Fs && iter < MaxIter
    n = double(n - step*D*grad(n(1),n(2)));
    disp(n)
    points2 = [points2,n];
    iter = iter+1;
end
%% display
[n1,n2] = meshgrid(-2:0.1:10, -2:0.1:10);
z = (n1 - 4).^2 + 10 * (n2 - 4).^2;

% Plot 1
subplot(121)
contour(n1, n2, z);
hold on;
scatter(points1(1,:), points1(2,:));
title('Descent Method (step = 0.01)')
xlabel('X1');
ylabel('X2');
hold off;

% Plot 2
subplot(122)
contour(n1, n2, z);
hold on;
plot(points2(1,:), points2(2,:),'ro-');
title('Descent Method (step = 0.1)');
xlabel('X1');
ylabel('X2');
hold off;

