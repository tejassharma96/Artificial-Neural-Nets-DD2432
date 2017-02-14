clear;
close all;
animals;

w = rand(100, 84);
eta = 0.2;
epochs = 20;

for i = 1:epochs
    % outer loop
    for a = 1:32
        p = props(a, :);
        m = w(1);
        for t = 1:100
                
        endfor
        dist = (ones(100, 1) * p - w)
        dist_squared = (ones(100, 1) * p - w)' * (ones(100, 1) * p - w);
        [val index] = min(dist_squared);

        radius = (epochs + 1 - i)*2;
        min_index = index - radius;
        max_index = index + radius;
        if min_index < 1
            min_index = 1;
        endif
        if max_index > 100
            max_index = 100;
        endif
        min_index
        max_index
        for ind = min_index:max_index
            w(ind, :) = w(ind, :) + eta*(p - w(ind, :));
        endfor

    endfor
endfor