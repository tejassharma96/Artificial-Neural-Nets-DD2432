clear;
close all;
cities;

out_nodes = 20;
w = rand(out_nodes, 2);
eta = 0.2;
epochs = 10;
for n = [2 1 0]
    for i = 1:(epochs * (3-n))
        % outer loop
        for a = 1:10
            p = city(a, :);
            dist = [abs(w(:, 1) - p(1)) abs(w(:, 2) - p(2))];
            dist_squared = sum(dist.^2, 2);
            [val, index] = min(dist_squared);

            for ind = 1:out_nodes
                if abs(mod(ind - index, out_nodes)) <= n
                    w(ind, :) = (1 - eta)*w(ind, :) + eta*(p);
                end
            end

            tour = [w;w(1,:)];
            plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'+')
            title(['Cities, ' int2str(out_nodes) ' nodes, neighborhood size=' int2str(n) ', epoch ' int2str(i)])
            pause(0.01)
        end
    end
end