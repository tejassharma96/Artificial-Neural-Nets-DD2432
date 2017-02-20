clear;
close all;

[x,y]= meshgrid([1:10],[1:10]);
xpos = reshape(x, 1, 100);
ypos = reshape(y, 1, 100);
setvotes;
setmpparty;
setmpsex;
setmpdistrict;
setmpnames;
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
            end
        end
        pos(a) = index;
        party(index, mpparty(a)+1) = party(index, mpparty(a)+1) + 1;

    end
end

a = ones(1, 100) * 350;
a(pos) = 1:349;

[~, order] = sort(pos);
t_manhattan = table(mpnames(order), mpsex_labels(((mpsex(order) + 1)')), ...
    party_labels(((mpparty(order) + 1)')), ...
    mpdistrict(order), ...
    pos(order)', ...
    'VariableNames',{'Name','Sex','Party','District','Cluster'});

% Display
b = zeros(1, 100);
for i = 1:100
    [vmax posMax] = max(party(i, :));
    if vmax > 0
        b(i) = posMax;
    end
end

figure(1);
p = [mpparty;0];
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0])
title('Most common party per unit');
image(p(reshape(a,10,10))+1);

figure(2);
d = [mpdistrict;0];
colormap default
title('Most common district per unit');
image(d(reshape(a,10,10))+1);

figure(3);
s = [mpsex;0];
colormap([0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0])
title('Most common sex per unit');
image(s(reshape(a,10,10))+1);