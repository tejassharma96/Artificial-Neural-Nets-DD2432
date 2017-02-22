

x1 = vm([0 0 1 0 1 0 0 1]);
x2 = vm([0 0 0 0 0 1 0 0]);
x3 = vm([0 1 1 0 0 1 0 1]);

W = zeros(8,8);

for c = 1:7
  for r = c+1:8
       W(r, c) = x1(r)*x1(c) + x2(r)*x2(c) + x3(r)*x3(c);
       W(c, r) = x1(r)*x1(c) + x2(r)*x2(c) + x3(r)*x3(c);
  endfor
endfor

W(:,1);

 for i = 1:8
   x1(i) = sgn(dot(W(:,i), x1));
   x2(i) = sgn(dot(W(:,i), x2));
   x3(i) = sgn(dot(W(:,i), x3));
endfor
