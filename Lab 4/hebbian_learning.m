clear;

x1 = vm([0 0 1 0 1 0 0 1]);
x2 = vm([0 0 0 0 0 1 0 0]);
x3 = vm([0 1 1 0 0 1 0 1]);

mat = [x1; x2; x3];

w = mat' * mat;

[x1_updated, ~] = update_weights(w, x1);
[x2_updated, ~] = update_weights(w, x2);
[x3_updated, ~] = update_weights(w, x3);

isequal(x1, x1_updated)
isequal(x2, x2_updated)
isequal(x3, x3_updated)