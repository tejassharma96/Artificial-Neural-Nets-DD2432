% plan: loop and update weights by doing a forward pass, then a backward pass
% forward pass: compute the activity for the nodes layer by layer
% backward pass: compute the error signal delta for each node, starting at the last layer and going backwards
% finally update weight with deltaW = -learning_factor*delta_h*X'
%                            deltaV = -learning_factor*delta_o*H'
% use momentum (formula from lab pdf, can't be bothered to write it here)

% set up X so that it has the extra layer of 1s for the bias
X = [patterns; ones(1, ndata)];

% generate weights
W = randn(hidden_nodes, insize + 1);
V = randn(insize, hidden_nodes + 1);

% set up delta values for weights so we can use momentum
delta_W = 0;
delta_V = 0;

% define an error vector
error = zeros(1, epochs);

for epoch = 1:epochs
    % forward pass
    hin = W*X;
    hout = [2 ./ (1 + exp(-hin)) - 1; ones(1, ndata)]; %phi function

    oin = V * hout;
    out = 2 ./ (1 + exp(-oin)) - 1; % phi function

    % backward pass
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5; % phi prime
    delta_h = (V' * delta_o) .* ((1 + hout) .* (1- hout)) * 0.5; % phi prime
    delta_h = delta_h(1:hidden_nodes, :); % remove extra layer

    % updating weights
    delta_W = (delta_W .* momentum) - (delta_h * X') .* (1 - momentum);
    delta_V = (delta_V .* momentum) - (delta_o * hout') .* (1 - momentum);
    W = W + delta_W .* learning_factor;
    V = V + delta_V .* learning_factor;

    % update error
    error(epoch) = sum(sum(abs(sign(out) - targets) ./ 2));

endfor