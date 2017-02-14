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
        m = 0;
        mindist = 1e10;
        for b = 1:100
            dist = (p - w(b))'*(p - w(b));
            if mindist > dist
                mindist = dist;
                m = b;
            endif
        endfor

        index = m;
        radius = (epochs + 1 - i)*2;
        min_index = index - radius;
        max_index = index + radius;
        if min_index < 1
            min_index = 1;
        endif
        if max_index > 100
            max_index = 100;
        endif
        for ind = min_index:max_index
            w(ind,:) = w(ind,:) + eta*(p - w(ind, :));
        endfor

    endfor
endfor

pos = zeros(32, 1);
for a = 1:32
    p = props(a,:);
    m = 0;
    mindist = 1e10;
    for b = 1:100
        dist = (p - w(b))'*(p - w(b));
        if mindist > dist
            mindist = dist;
            m = b;
        endif
    endfor

    index = m;
    pos(a) = index;
endfor

[dummy, order] = sort(pos);
snames(order)'