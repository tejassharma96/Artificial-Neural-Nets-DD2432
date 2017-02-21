function [x_final, iterations] = update_patterns_sequential(w, x, iterlimit)
    N = size(w, 1);
    figure;
    x = x';
    if nargin < 3
        iterlimit = 1500;
    end
    E = [];
    iterations = 0;
    x_final = x;
    while iterations < iterlimit
        for i = randperm(N)
            x_final(i) = sgn(w(i, :) * x_final);
            iterations = iterations + 1;
            if mod(iterations, 100) == 0
                vis(x_final);
                title([num2str(iterations) ' iterations']);
                hold on;
                pause(0.5);
            end
        end
    end
    x_final = x_final';
end