% special case of backprop
% use three nodes in the hidden layer, with 8 input and output nodes

clear;

% generate the special case of patterns and targets
patterns = eye(8) * 2 - 1;
targets = patterns;

% create constants and set number of hidden nodes to 3
create_constants;
hidden_nodes = 3;
epochs = 50000;

backprop;

% plot error
plot(1:epochs, error);