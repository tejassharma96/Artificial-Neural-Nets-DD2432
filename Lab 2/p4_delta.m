clear;

x = (0:0.1:2*pi)';
fun = 'sin2x';
n = size(x, 1);
N = n;
units = 60;
eta = 3;
 
makerbf;

iter = 0;
itersub = 20;
itermax = 2000;

diter;

% 40 3 0.8