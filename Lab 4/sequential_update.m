clear;
close all;

pict;
patterns = [p1; p2; p3];
[P, N] = size(patterns);
% first train weights with these patterns
w = calc_weights(patterns);

% see if it can recreate p1 and p2 from slightly degraded versions
[p1_from_degraded, it_p11] = update_patterns(w, p11);
[p2_from_degraded, it_p22] = update_patterns(w, p22, 1000);

figure;
subplot(2, 2, 1);
vis(p1);
title('Original p1');
subplot(2, 2, 2);
vis(p11);
title('Degraded p1 (p11)');
subplot(2, 2, 3);
vis(p1_from_degraded);
title(['p11 after ' num2str(it_p11) ' iterations']);

figure;
subplot(2, 2, 1);
vis(p2);
title('Original p2');
subplot(2, 2, 2);
vis(p22);
title('Degraded p2 (p22)');
subplot(2, 2, 3);
vis(p2_from_degraded);
title(['p22 after ' num2str(it_p22) ' iterations']);

% iterations = 0;
% converged = false;
% x = p11';
% x_final = p11';
% while not(converged) && iterations < 1000
%     for i = randperm(N)
%         x_final(i) = sgn(w(i, :) * x_final);
%         iterations = iterations + 1;
%         if mod(iterations, 100) == 0
%             vis(x_final);
%             title([num2str(iterations) 'iterations']);
%             hold on;
%         end
%         converged = isequal(x_final, x);
%         if converged
%             break;
%         end
%         x = x_final;
%     end
% end

figure;
update_patterns_sequential(w, p11);