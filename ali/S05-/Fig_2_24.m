clear
clc
close
%% Function
syms x mu c landa
NumVar=2;

% cost function
Cost(x) = (x+1)^2;


% C coefficetns and landa
ClTerm = (1/(2*c)) * (max(0,landa-c*x) - landa^2);

% Objective function
f(x,landa,c) = Cost + ClTerm;
%
grad = diff(Cost,x);

argX = solve(grad,x) ;
% argX = argX;

% Xs(landa,c) = argX + (1/(2*c))*(max(0,landa-c*x))^2;
Xs(landa,c) = (landa - 2)/(2+c);





%% Descent method with stepsize = 0.01;
step = 1E-3;
Fs = 1E-8;
MaxIter = 33;


D = eye(NumVar,NumVar);

% start pionts
n = -0.75;
l = 0;
C = 2;

points1 = [];
points2 = [];

iter = 0;


while double(f(n,l,C)) > Fs && iter < MaxIter

    points1 = [points1,n];
    points2 = [points2,l];


    l =  max(0,l - C*n);
    n = Xs(l,C);


    % n = double(n - step*D*grad(n(1),n(2),u,C));
    % C = 1.1*C;

    iter = iter+1;
end
disp(double(n)) 
%% Plot
hold on
plot(points1,'o-');
plot(points2,'o-');
legend(["x","landa"])

