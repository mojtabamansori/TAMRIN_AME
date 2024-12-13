clear
clc
close
%% Function
syms x1 x2 x3 x4 mu1 mu2 c
NumVar=4;

% cost function
Cost(x1,x2,x3,x4) = ( x1/(2-x1) ) + ( x4/(3-x4) )  + ...
    ( (x2+x4)/(3-x2-x4) ) + ((x1+x3)/(2-x1-x3));

% Mue coefficetns
MuTerm = mu1*(x1+x2-2) + mu2*(x3+x4-2);

% C coefficetns
CTerm = (c/2)*( (x1+x2-2))^2 + ((x3+x4-2)^2 );

% Lagrange 
syms l1 l2 l3 l4
landa = [l1 l2 l3 l4];
X = [x1 x2 x3 x4];
Mu = [mu1,mu2];

% Gradiant calcultation
ff(X,landa,Mu,c) = Cost + MuTerm + CTerm;

grad = [diff(ff,x1) - max(0,landa(1)-(c*X(1)));
        diff(ff,x2) - max(0,landa(2)-(c*X(2)));
        diff(ff,x3) - max(0,landa(3)-(c*X(3)));
        diff(ff,x4) - max(0,landa(4)-(c*X(4)))];

argX(X,landa,Mu,c) = [solve(diff(ff,x1),x1);
                      solve(diff(ff,x2),x2);
                      solve(diff(ff,x3),x3)
                      solve(diff(ff,x2),x4)] ;

% ((l-2)/(2+c))
% Lagrange Calcultation
Lagrange = Cost + MuTerm + CTerm;
for i=1:4
    Lagrange = Lagrange + (1/(2*c))*( max(0, landa(i)-c*X(i))^2 - landa(i)^2 );
    % Lagrange = Lagrange+max(0,landa(i)-(c*X(i)));
end

f(X,landa,Mu,c) = Lagrange;

%% Descent method with stepsize = 0.01;
step = 1E-3;
Fs = 1E-3;
MaxIter = 200;


% start pionts
% n = [-0.25;1.1;0.75;0.2];
 n = [0;0;0;0];
u = [0;0];
l = [0;0;0;0];
C = 2;
D = eye(NumVar,NumVar);
% % 
points1 = [];
points2 = [];
points3 = [];
iter = 0;
while double(f(n(1),n(2),n(3),n(4),l(1),l(2),l(3),l(4),u(1),u(2),C)) > Fs && iter < MaxIter
    
    points1 = [points1,n];
    points2 = [points2,u];
    points3 = [points3,l];

    l(1) = max(0,l(1)-(C*n(1)));
    l(2) = max(0,l(2)-(C*n(2)));
    l(3) = max(0,l(3)-(C*n(3)));
    l(4) = max(0,l(4)-(C*n(4)));


    u(1) =  u(1) + C*(n(1)+n(2)-2);
    u(1) =  u(2) + C*(n(3)+n(4)-2);


    % n = double(n - step*D*grad(n(1),n(2),n(3),n(4),l(1),l(2),l(3),l(4),u(1),u(2),C));
    n = argX(n(1),n(2),n(3),n(4),l(1),l(2),l(3),l(4),u(1),u(2),C);

    C = 2*C;


    iter = iter+1;
end

disp(n) 
%% Plot


subplot(121)
hold on
plot(points1(1,:),'o-');
plot(points1(2,:),'o-');
plot(points1(3,:),'o-');
plot(points1(4,:),'o-');
legend(["x1","x2","x3","x4"])

subplot(122)
hold on
plot(points3(1,:),'o-');
plot(points3(2,:),'o-');
plot(points3(3,:),'o-');
plot(points3(4,:),'o-');

plot(points2(1,:),'o-');
plot(points2(2,:),'o-');
legend(["l1","l2","l3","l4","mu1","mu2"])
