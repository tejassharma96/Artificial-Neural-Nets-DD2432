clear;
close all;

pict;
patterns = [p1; p2; p3];
[P, N] = size(patterns);
% first train weights with these patterns
w = calc_weights(patterns);

% see if it can recreate p1 and p2 from slightly degraded versions
p1_from_degraded = update_patterns(w, p11);
p2_from_degraded = update_patterns(2, p22);

figure;
