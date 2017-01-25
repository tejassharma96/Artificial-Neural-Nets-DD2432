% plan: loop and update weights with formula delta_W = -learning_factor * (W.X - T)X'
% needs to be repeated epochs times, 20 is a good number for epoch
% learning factor should be suitably small: 0.001

% set up X so that it has the extra layer of 1s for the bias
X = [patterns; ones(1, ndata)];

% generate weights
W = randn(1, insize + 1);

% perform delta rule
for i = 0:epochs
    W -= learning_factor * (W*X - targets)*X';

    % graph each epoch
    p = W(1, 1:2);
    k = -W(1, insize+1) / (p*p');
    l = sqrt(p*p');
    axis ([-2, 2, -2, 2], 'square')
    plot(patterns(1, find(targets>0)), ...
        patterns(2, find(targets>0)), '*', ...
        patterns(1, find(targets<0)), ...
        patterns(2, find(targets<0)), '+', ...
        [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
        [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
    drawnow;

endfor