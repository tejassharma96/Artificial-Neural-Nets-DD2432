% plan: loop and update weights by doing a forward pass, then a backward pass
% forward pass: compute the activity for the nodes layer by layer
% backward pass: compute the error signal delta for each node, starting at the last layer and going backwards
% finally update weight with deltaW = -learning_factor*delta_h*X'
%                            deltaV = -learning_factor*delta_o*H'
% use momentum (formula from lab pdf, can't be bothered to write it here)

clear;
sepdata;
learning_factor = 0.001;
momentum = 0.9

% get dimensions
[insize, ndata] = size(patterns)
[outsize, ndata] = size(targets)

% set up X so that it has the extra layer of 1s for the bias
X = [patterns; ones(1, ndata)];

% define a variable for the number of nodes in the hidden layer
hidden_nodes = 3

% generate weights
W = randn(1, insize + 1)
V = randn(1, hidden_nodes + 1)

% set up delta values for weights so we can use momentum
delta_W = 0
delta_V = 0