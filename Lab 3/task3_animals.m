clear;
close all;
animals;

out_nodes = 20;
w = rand(out_nodes, 84);
eta = 0.2;
epochs = 40;

for i = 1:epochs
    % outer loop
    for a = 1:32
        p = props(a, :);
        dist = (ones(out_nodes, 1) * p - w);
        dist_squared = sum(dist.^2, 2);
        [val index] = min(dist_squared);

        radius = (epochs + 1 - i)*2;
        min_index = index - radius;
        max_index = index + radius;
        if min_index < 1
            min_index = 1;
        end
        if max_index > out_nodes
            max_index = out_nodes;
        end
        for ind = min_index:max_index
            w(ind, :) = w(ind, :) + eta*(p - w(ind, :));
        end

    end
end

pos = zeros(32, 1);
for a = 1:32
    p = props(a,:);
    dist = (ones(out_nodes,1) * p - w);
    dist_squared = sum(dist.^2, 2);
    [val index] = min(dist_squared);
    pos(a) = index;
end

[dummy, order] = sort(pos);
epochs
table(snames(order)', pos(order), 'VariableNames', {'Animal', 'Cluster'})