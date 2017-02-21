clear;

x1 = vm([0 0 1 0 1 0 0 1]);
x2 = vm([0 0 0 0 0 1 0 0]);
x3 = vm([0 1 1 0 0 1 0 1]);

mat = [x1; x2; x3];

% calculate weights
w = calc_weights(mat, 0, 0);

% run updates
[x1_updated, ~] = update_patterns(w, x1);
[x2_updated, ~] = update_patterns(w, x2);
[x3_updated, ~] = update_patterns(w, x3);

% make sure nothing changed
isequal(x1, x1_updated);
isequal(x2, x2_updated);
isequal(x3, x3_updated);

% see if memory can recall from distorted input patterns
x1d=vm([1 0 1 0 1 0 0 1]);
x2d=vm([1 1 0 0 0 1 0 0]);
x3d=vm([1 1 1 0 1 1 0 1]);
x4d = vm([0 0 1 0 1 0 0 1]);
x5d = vm([0 0 1 0 1 0 0 1]);

test_patterns = [x1d; x2d; x3d];
for x = test_patterns'
    [x_updated, it] = update_patterns(w, x');
    fprintf('Got %s from %s in %d iterations\n', num2str(t0(x_updated)), num2str(t0(x')), it);
end

% success!
% number of attractors
attractors = mat;
for i = permn([0 1], 8)'
    [x_updated, ~] = update_patterns(w, vm(i)');
    if not(ismember(x_updated, attractors, 'rows'))
        attractors = [attractors; x_updated];
    end
end