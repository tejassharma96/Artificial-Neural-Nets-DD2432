% plan: loop and update weights with formula delta_W = -learning_factor * (W.X - T)X'
% needs to be repeated epochs times, 20 is a good number for epoch
% learning factor should be suitably small: 0.001

clear;
sepdata;
learning_factor = 0.001
epochs = 20
% set up X so that it has the extra layer of 1s for the bias
X = [patterns; ones(1, ndata)];

% get dimensions
[insize, ndata] = size(patterns)
[outsize, ndata] = size(targets)