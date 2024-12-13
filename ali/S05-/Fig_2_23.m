clear
clc
close
%% Function
syms x1 x2 mu c
NumVar=2;

% cost function
Cost(x1,x2) = (1/2) * (x1^2+x2^2);

% Mue coefficetns
MuTerm = mu*(x1-1);

% C coefficetns
CTerm = (c/2)*(MuTerm/mu)^2;

% Objective function
f(x1,x2,mu,c) = Cost + MuTerm + CTerm;
%
grad = [diff(f,x1);
        diff(f,x2)];
argX = solve(grad);
argX = [argX.x1;argX.x2];
Xs1(mu,c) = argX(1);
Xs2(mu,c) = argX(2);
Xs(mu,c) = [Xs1;Xs2];



%% Descent method with stepsize = 0.01;
step = 1E-3;
Fs = 1E-5;
MaxIter = 8;


D = eye(NumVar,NumVar);

% start pionts
n = [0.5;0];
u = 0;
C = 2;

points1 = [];
points2 = [];

iter = 0;


while double(f(n(1),n(2),u,C)) > Fs && iter < MaxIter

    points1 = [points1,n];
    points2 = [points2,u];

    
    u =  u + C*(n(1)-1);
    n = Xs(u,C);

    
    % n = double(n - step*D*grad(n(1),n(2),u,C));
    % C = 1.1*C;

    iter = iter+1;
end
disp(n) 
%% Plot
hold on
plot(points1(1,:),'o-');
plot(points1(2,:),'o-');
plot(points2,'o-');
legend(["x1","x2","mu"])

