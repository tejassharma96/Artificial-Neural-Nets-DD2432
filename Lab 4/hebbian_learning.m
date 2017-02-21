clear;

x1 = vm([0 0 1 0 1 0 0 1]);
x2 = vm([0 0 0 0 0 1 0 0]);
x3 = vm([0 1 1 0 0 1 0 1]);

mat = [x1; x2; x3];

% calculate weights
w = calc_weights(mat);

% run updates
[x1_updated, ~] = update_weights(w, x1);
[x2_updated, ~] = update_weights(w, x2);
[x3_updated, ~] = update_weights(w, x3);

% make sure nothing changed
isequal(x1, x1_updated)
isequal(x2, x2_updated)
isequal(x3, x3_updated)

% see if memory can recall from distorted input patterns
x1d=vm([1 0 1 0 1 0 0 1]);
x2d=vm([1 1 0 0 0 1 0 0]);
x3d=vm([1 1 1 0 1 1 0 1]);

test_patterns = [x1d; x2d; x3d];
for x = test_patterns'
    [x_updated, it] = update_weights
end

