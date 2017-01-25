% approximating a continuous function, the gaussian function

clear;

% generate the function
x = [-5:1:5]';
y = x;
z = exp(-x .* x * 0.1) * exp(-y .* y * 0.1)' - 0.5;

% view the function
mesh(x, y, z);

% create data in learning format
gridsize = numel(x);
ndata = gridsize * gridsize;
targets = reshape (z, 1, ndata);
[xx, yy] = meshgrid(x, y);
patterns = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];

create_constants; % create necessary constants
ndata = gridsize * gridsize;
epochs = 5000;
backprop;

% plot result
zz = reshape(out, gridsize, gridsize);
mesh(x, y, zz)
axis([-5 5 -5 5 -0.7 0.7]);
drawnow;