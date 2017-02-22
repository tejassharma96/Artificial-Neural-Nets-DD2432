clear;
close all;

pict;
patterns = [p1; p2; p3];
[P, N] = size(patterns);
w = calc_weights(patterns);

noisy_pixels = [5, 10, 50, 100, 200, 300, 400, 500, 800, 1000];
for n = noisy_pixels
    figure;
    x = flip(p1, n);
    subplot(1,2,1);
    vis(x);
    title(sprintf('Flipping %.2f percent of the pixels of p1',...
        n/N*100));
    [x_final, it] = update_patterns(w, x, patterns);
    subplot(1,2,2);
    vis(x_final);
    title(sprintf('Result after %d iterations', it));
end