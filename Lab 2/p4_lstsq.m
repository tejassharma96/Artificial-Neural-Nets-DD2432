clear;
%close all;

x = (0:0.1:7)';
% f = sin(2*x) or f = square(2*x)
f = our_function(2*x);
n = size(x, 1);
N = n;
units = 71;

makerbf;
phi = calcPhi(x, m, variance);

w = phi\f;
y = phi*w;

y_sq_check = sign(y);
f_sq_check = square(2*x);
rbfplot1(x, y, f, units);

%{
sin:
    5 units: 1.1238
    6 units: 0.13277
    min units for 0.1: 7
    min units for 0.01: 25
    min units for 0.001: 56
- big difference b/w 5 and 6 because of number of points equal to number of
extrema + start and end point
number of "curves" bounded by number of units sort of
square:
    min units for 0.1: 62
    min units for 0.01: 63
    min units for 0.001: 63
    (basically drops to 4e-16 at 63)
- Not sure which use it's similar to
- The square function is like looking at the sign of the sin function, if
sin(x) > 0, square(x) = 1
  We can just approximate the sin function instead with 6 nodes and use the
  sign of it
  Theoretically should be doable with units = 6
  Apparently not close enough though
- Yes XOR should be doable
%}