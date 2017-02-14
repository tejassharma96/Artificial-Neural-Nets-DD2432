clear;
close all;
cities;

w = rand(10, 2);
eta = 0.2;
epochs = 10;
for n = [2 1 0]
    for i = 1:(epochs * (3-n))
        % outer loop
        for a = 1:10
            p = city(a, :);
            dist = [abs(w(:, 1) - p(1)) abs(w(:, 2) - p(2))];
            dist_squared = sum(dist.^2, 2);
            [val index] = min(dist_squared);

            for ind = 1:10
                if abs(mod(ind - index, 10)) <= n
                    w(ind, :) = (1 - eta)*w(ind, :) + eta*(p);
                endif
            endfor

            tour = [w;w(1,:)];
            plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'+')
            title(['Cities, neighborhood size=' int2str(n) ', epoch ' int2str(i)])
            pause(0.01)
        endfor
    endfor
endfor