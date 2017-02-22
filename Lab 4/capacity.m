clear;
close all;

pict;
all_patterns = [p1; p2; p3; p4; p5; p6; p7; p8; p9];
print_pattern_stat(all_patterns);
noisy_pixels = 100;
repetitions = 20;

figure;
for i=1:9
    subplot(3,3,i);
    vis(all_patterns(i, :));
end

performances = [];
for P = 1:size(all_patterns, 1)
    patterns = all_patterns(1:P, :);
    w = calc_weights(patterns);
    
    successes = 0;
    for original_pat = patterns'
        for i = 1:repetitions
            distorted_pat = flip(original_pat', noisy_pixels);
            reconstructed_pat = update_patterns(w, distorted_pat);
            if sum(original_pat' ~= reconstructed_pat) < 5
                successes = successes + 1;
            end
        end
    end
    
    performance = double(successes) / double((P*repetitions));
    performances = [performances, performance];
end

figure;
plot(1:size(all_patterns, 1), performances);
title('Performance over number of images for pict images');