function [x_final, iterations] = update_patterns(w, x, patterns, iterlimit)
    x = x';
    if nargin < 4
        iterlimit = 1000;
    end
    if nargin < 3
        patterns = 0;
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
end