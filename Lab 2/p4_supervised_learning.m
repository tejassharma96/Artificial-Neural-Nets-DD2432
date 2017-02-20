x = (0:0.1:2*pi)';
f = sin2x(x);
n = size(x, 1);
N = n;
units = 4;

makerbf;
phi = calcPhi(x, m, variance);

w = phi\f;
y = phi*w;

rbfplot1(x, y, f, units);