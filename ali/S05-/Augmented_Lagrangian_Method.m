clc
clear
close all
syms x1 x2 x3 x4

x = [-0.2 1.1 0.75 0.09];
la = [0 0 0 0];
mu=[0 0];
c0=2;
B=2;
alpha = 0.001;
D = eye(4);
xn=x;
c(1)=c0;
max_iter = 8;
n=1;
ep = 0.0003;


for iter = 1:max_iter
    
    g=0;
    for i=1:4
        g= g+ max(0,la(end,i)-(c(n)*xn(end,i)));
    end
    lag(x1,x2,x3,x4) = (x1/(2-x1))+(x4/(3-x4))+((x2+x4)/(3-x2-x4))+((x1+x3)/(2-x1-x3))+mu(n,1)*...
        (x1+x2-2)+mu(n,2)*(x3+x4-2)+(c(n)/2)*(x1+x2-2)^2+(c(n)/2)*(x3+x4-2)^2+g;
    
    gradient=[diff(lag,x1);diff(lag,x2);diff(lag,x3);diff(lag,x4)];
   
    k=n;
    while (1)
        xn(k+1,:)=xn(k,:)-(alpha*D*gradient(...
            xn(k,1)- max(0,la(end,1)-(c(n)*xn(end,1))),...
            xn(k,2)- max(0,la(end,1)-(c(n)*xn(end,2))),...
            xn(k,3)- max(0,la(end,1)-(c(n)*xn(end,3))),...
            xn(k,4)- max(0,la(end,1)-(c(n)*xn(end,4)))))';

 %       change = abs( lag(xn(end,1),xn(end,2),xn(end,3),xn(end,4))-lag(xn(end-1,1),xn(end-1,2),xn(end-1,3),xn(end-1,4)));
         change= abs(xn(end,:)-xn(end-1,:));
if ep > change  | k==500
            break;
        end
        k=k+1 
    end
    
    x(n+1,:)=xn(end,:);
    
    c(n+1)=B*c(n);
    
    mu(n+1,1)= mu(n,1)+c(n)*(xn(end,1)+xn(end,2)-2);
    mu(n+1,2)= mu(n,2)+c(n)*(xn(end,3)+xn(end,4)-2);
    
    la(n+1,1)= max(0,la(n,1)-(c(n)*(x(end,1))));
    la(n+1,2)= max(0,la(n,2)-(c(n)*xn(end,2)));
    la(n+1,3)= max(0,la(n,3)-(c(n)*xn(end,3)));
    la(n+1,4)= max(0,la(n,4)-(c(n)*xn(end,4)));
    
    xn=x; 
    n=n+1;
    it(n)=iter;
end

subplot(1,2,1)
plot(it,x(:,1),'O-')
hold on
plot(it,x(:,2),'O-')
hold on
plot(it,x(:,3),'O-')
hold on
plot(it,x(:,4),'O-')
hold on
legend('x1', 'x2', 'x3', 'x4')
ylim([-0.5 2.5])
grid on
xlabel('iteration number (\itK)')

subplot(1,2,2)
plot(it,mu(:,1),'O-')
hold on
plot(it,mu(:,2),'O-')
hold on
plot(it,la(:,1),'O-')
hold on
plot(it,la(:,2),'O-')
hold on
plot(it,la(:,3),'O-')
hold on
plot(it,la(:,4),'O-')
hold on
legend('mu1', 'mu2','la1', 'la2', 'la3', 'la4')
ylim([-12 2])
xlabel('iteration number (\itK)')
grid on
