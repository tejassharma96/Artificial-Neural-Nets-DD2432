function [w] = calc_weights(patterns, correct_diagonal)
    if nargin < 2
        correct_diagonal = 1;
    end
    [~, N] = size(patterns);
    w = patterns' * patterns ./ N;
    if correct_diagonal
        w = w - diag(diag(w));
    end
end

