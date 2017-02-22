function [x_final, iterations] = update_patterns_sequential(w, x, iterlimit)
    N = size(w, 1);
    figure;
    x = x';
    if nargin < 3
        iterlimit = 10000;
    end
    E = zeros(1, iterlimit);
    iterations = 0;
    x_final = x;
    converged = false;
    while not(converged) && iterations < iterlimit
        for i = randperm(N)
            x_final(i) = sgn(w(i, :) * x_final);
            iterations = iterations + 1;
            E(iterations) = energy(w, x_final);
            if mod(iterations, 10) == 0
                subplot(1, 2, 1);
                vis(x_final);
                title([num2str(iterations) ' iterations']);
                subplot(1, 2, 2);
                plot(iterations, E(iterations), 'r.');
                title(['Energy ' num2str(E(iterations))]);
                xlabel('Iterations');
                ylabel('Energy');
                hold on;
                pause(0.05);
            end
            if iterations > 1
                s = find(diff(E(1:iterations)) ~= 0);
                if isempty(s)
                    s = iterations;
                end
                constant_energy = iterations - s(end);
                if constant_energy > N/4
                    converged = true;
                    break;
                else
                    converged = false;
                end
            end
        end
    end
    x_final = x_final';
end