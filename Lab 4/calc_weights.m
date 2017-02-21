function [w] = calc_weights(patterns)
    w = patterns' * patterns;
end

