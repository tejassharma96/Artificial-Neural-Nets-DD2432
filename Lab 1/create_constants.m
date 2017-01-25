% creates the necessary constants
% number of times the learning should happen
epochs = 20;

% rate at which learning changes
learning_factor = 0.001;

% amount of previous learning to keep
momentum = 0.9;

% compute sizes
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

% number of nodes in the second layer
hidden_nodes = 4;