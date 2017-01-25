% clears everything, generates the data and runs backprop

clear;
sepdata; % generate data
create_constants; % generate constants
backprop; % perform backprop
plot(1:epochs, error); % plot error