clear;
close all;
cities;

w = rand(10, 2);
eta = 0.2;
epochs = 50;

for i = 1:epochs
    % outer loop
    for a = 1:10
        p = city(a, :);
        dist = abs(p(a)(1) - w(a)(1)) + abs(p(a)(2) - w(a)(2));
        dist_squared = sum(dist.^2, 2);
        [val index] = min(dist_squared);

        %radius = (epochs + 1 - i)*2;
        radius = 2
        min_index = index - radius;
        max_index = index + radius;
        if min_index < 1
            min_index = 1;
        endif
        if max_index > 100
            max_index = 100;
        endif
        for ind = min_index:max_index
            w(ind, :) = w(ind, :) + eta*(p - w(ind, :));
        endfor

    endfor
endfor