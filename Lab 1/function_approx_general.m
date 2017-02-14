% approximating a continuous function, the gaussian function

clear;

% generate the function
x = [-5:1:5]';
y = x;
z = exp(-x .* x * 0.1) * exp(-y .* y * 0.1)' - 0.5;

% view the function
figure(1);
mesh(x, y, z);

% create data in learning format
gridsize = numel(x);
ndata = gridsize * gridsize;
targets = reshape (z, 1, ndata);
[xx, yy] = meshgrid(x, y);
patterns = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];

% permute and use first n
% save targets and patterns first for for second forward pass
targets_orig = targets;
patterns_orig = patterns;
ndata_orig = ndata;

n = 10; % change between 10 and 25
permute = randperm(ndata);
patterns = patterns(:, permute);
targets = targets(:, permute);

patterns = patterns(:, 1:n);
targets = targets(:, 1:n);

create_constants; % create necessary constants
epochs = 5000;
hidden_nodes = 25; % change between 5 and 25

% Can't use the function if we want to graph each epoch, have to copy the code here :-(
X = [patterns; ones(1, ndata)];

% generate weights
W = randn(hidden_nodes, insize + 1);
V = randn(outsize, hidden_nodes + 1);

% set up delta values for weights so we can use momentum
delta_W = 0;
delta_V = 0;

% define an error vector
error = zeros(1, epochs);

for epoch = 1:epochs
    % forward pass
    hin = W*X;
    hout = [2 ./ (1 + exp(-hin)) - 1; ones(1, ndata)]; % phi function

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

    % forward pass for test
    hin_test = W*[patterns_orig; ones(1, ndata_orig)];
    hout_test = [2 ./ (1 + exp(-hin_test)) - 1; ones(1, ndata_orig)]; % phi function

    oin_test = V*hout_test;
    out_test = 2 ./ (1 + exp(-oin_test)) - 1; % phi function

    

endfor

% plot result
zz = reshape(out_test, gridsize, gridsize);
figure(2);
mesh(x, y, zz)
axis([-5 5 -5 5 -0.7 0.7]);
drawnow;