clear;
close all;

[x,y]= meshgrid([1:10],[1:10]);
xpos = reshape(x, 1, 100);
ypos = reshape(y, 1, 100);
votes;
mpparty;
mpsex;
mpdistrict;
eta = 0.2;
epochs = 50;
pos = ones(1, 349);

w = rand(100, 31);
party = zeros(100, 8);

for i = 1:epochs
    % outer loop

    for a = randperm(349)
        mp = votes(a, :);
        dist = (ones(100, 1) * mp - w);
        dist_squared = sum(dist.^2, 2);
        [val index] = min(dist_squared);

        n = 3 - 3*(i/epochs);

        for ind = 1:100
            d = abs(xpos(ind) - xpos(index)) + abs(ypos(ind) - ypos(index));
            if d <= n
                w(ind, :) = w(ind, :) + eta*(mp - w(ind, :));
            endif
        endfor
        pos(a) = index;
        party(index, mpparty(a)+1) = party(index, mpparty(a)+1) + 1;

    endfor
endfor

a = ones(1, 100) * 350;
a(pos) = 1:349;


% Display
b = zeros(1, 100);
for i = 1:100
    [vmax posMax] = max(party(i, :));
    if vmax > 0
        b(i) = posMax;
    endif
endfor

figure(1);
title('Most common party per unit');
p = [mpparty;0];
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0])
image(p(reshape(a,10,10))+1);

figure(2);
title('Most common district per unit');
d = [mpdistrict;0];
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0])
image(d(reshape(a,10,10))+1);

figure(3);
title('Most common sex per unit');
s = [mpsex;0];
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0])
image(s(reshape(a,10,10))+1);