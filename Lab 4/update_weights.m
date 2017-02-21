function [x_final, iterations] = update_weights(w, x, iterlimit)
    x = x';
    if nargin < 3
        iterlimit = 100;
    end
    converged = false;
    iterations = 0;
    while not(converged) && iterations < iterlimit
        x_final = sgn(w * x);
        converged = isequal(x_final, x);
        iterations = iterations + 1;
        x = x_final;
    end
    x_final = x_final';