clear;
close all;

plotinit;
data = read('cluster');
units = 5;
vqinit;
singlewinner = 1;
title('CL - Single Winner');
vqiter;


clear;
plotinit;
data = read('cluster');
units = 5;
vqinit;
singlewinner = 0;
title('CL - All Units');
vqiter;

clear;
plotinit;
data = read('cluster');
units = 5;
vqinit;
singlewinner = 1;
title('EM - Single Winner');
emiterb;

clear;
plotinit;
data = read('cluster');
units = 30;
vqinit;
singlewinner = 0;
title('EM - All Units');
emiterb;