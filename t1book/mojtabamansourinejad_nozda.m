f = @(x) (x(1) - 4)^2 + 10*(x(2) - 4)^2;
gradf = @(x) [2*(x(1) - 4); 20*(x(2) - 4)];

x0 = [0; 0];
tol = 1e-3;
maxiter = 1000;
sigma = 0.01;
betas = [0.5, 0.1];

figure;
for i = 1:2
    beta = betas(i);
    x = x0;
    iter = 0;
    xhist = x;

    while true
        g = gradf(x);
        s = 1;
        while f(x - s * g) > f(x) - sigma * s * norm(g)^2
            s = beta * s;
        end
        
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
    title(['s = 1, sigma = 0.01, beta = ', num2str(beta), ', Iter = ', num2str(iter)]);
    xlabel('x1');
    ylabel('x2');
    axis equal;
    grid on;
    text(x(1), x(2), ['(', num2str(x(1), '%.2f'), ', ', num2str(x(2), '%.2f'), ')'], 'VerticalAlignment', 'top');
end
