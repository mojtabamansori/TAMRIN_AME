f = @(x) (x(1) - 4)^2 + 10*(x(2) - 4)^2;
gradf = @(x) [2*(x(1) - 4); 20*(x(2) - 4)];

x0 = [0; 0];
tol = 1e-3;
maxiter = 1000;
steps = [0.1, 0.01];

figure;
for i = 1:2
    s = steps(i);
    x = x0;
    iter = 0;
    xhist = x;

    while true
        g = gradf(x);
        xnew = x - s * g;
        iter = iter + 1;
        xhist = [xhist, xnew];

        if norm(xnew - x) < tol || iter >= maxiter
            break;
        end

        x = xnew;
    end

    subplot(1, 2, i);
    hold on;
    [X1, X2] = meshgrid(-2:0.1:10, -2:0.1:10);
    F = (X1 - 4).^2 + 10*(X2 - 4).^2;
    contour(X1, X2, F, 20);
    plot(xhist(1, :), xhist(2, :), '-o');
    plot(4, 4, 'r*', 'MarkerSize', 10);
    title(['s = ', num2str(s), ', Iter = ', num2str(iter)]);
    xlabel('x1');
    ylabel('x2');
    axis equal;
end
