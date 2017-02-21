function [w] = calc_weights(patterns, normalize, correct_diagonal)
    [~, N] = size(patterns);
    if nargin < 3
        correct_diagonal = 1;
    end
    if nargin < 2
        normalize = 0;
    end
    w = patterns' * patterns;
    if normalize
        w = w ./ N;
    end
    if correct_diagonal
        w = w - diag(diag(w));
    end
end

