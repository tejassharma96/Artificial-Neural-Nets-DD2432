clear;

x = (0:0.1:2*pi)';
fun = 'sin2x';
n = size(x, 1);
N = n;
units = 6;
eta = 0.2;
 
makerbf;

iter = 0;
itersub = 20;
itermax = 2000;

diter;