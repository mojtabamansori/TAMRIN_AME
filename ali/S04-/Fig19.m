clear
clc
close
%% Function
syms x1 x2
f(x1,x2) = (x1-4)^2 + 10*(x2-4)^2;
NumVar = 2; % number of variables

%% the steepest descent method using the Armijo rule
Fs = 1E-3;
MaxIter = inf;

step = 0.1;
beta = 1E-1; % Step size reduction factor
sigma = 1E-3; % Armijo rule constant

grad = [diff(f,x1);diff(f,x2)];
D = -grad;

n = [0;0]; % start point

points1 = n;
iter = 0;
while f(n(1),n(2)) > Fs && iter < MaxIter
    
    DAux = D(n(1),n(2));
    condition1 = f(n(1) +step*DAux(1),n(2)+step*DAux(2));
    condition2 = f(n(1),n(2)) + sigma*step*grad(n(1),n(2))'*D(n(1),n(2));
 
    while f(n(1) +step*DAux(1),n(2)+step*DAux(2))  >  f(n(1),n(2)) + sigma*step*grad(n(1),n(2))'*D(n(1),n(2))
        step = beta*step;
    end
    n = double(n + step*D(n(1),n(2)));
    points1 = [points1,n];
    iter = iter+1;
end

%% the steepest descent method using the Armijo rule
Fs = 1E-3;
MaxIter = inf;

step = 1;
beta = 0.5; % Step size reduction factor
sigma = 1E-3; % Armijo rule constant

grad = [diff(f,x1);diff(f,x2)];
D = -grad;

n = [0;0]; % start point

points2 = n;
iter = 0;
while f(n(1),n(2)) > Fs && iter < MaxIter
    
    DAux = D(n(1),n(2));
    condition1 = f(n(1) +step*DAux(1),n(2)+step*DAux(2));
    condition2 = f(n(1),n(2)) + sigma*step*grad(n(1),n(2))'*D(n(1),n(2));
 
    while f(n(1) +step*DAux(1),n(2)+step*DAux(2))  >  f(n(1),n(2)) + sigma*step*grad(n(1),n(2))'*D(n(1),n(2))
        step = beta*step;
    end
    n = double(n + step*D(n(1),n(2)));
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
plot(points1(1,:), points1(2,:),'ro-');
title('Armijo rule (step = 1E-1,beta= 1E-1, sigma = 1E-3)')
xlabel('X1');
ylabel('X2');
hold off;

% Plot 2
subplot(122)
contour(n1, n2, z);
hold on;
plot(points2(1,:), points2(2,:),'ro-');
title('Armijo rule (step = 1 ,beta= 0.5, sigma = 1E-3)')
xlabel('X1');
ylabel('X2');
hold off;


