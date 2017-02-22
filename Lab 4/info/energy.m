iterations = 5;

pict;
W = p1'*p1 + p2'*p2 + p3'*p3;

ep1 = -p1*(W*p1');
ep2 = -p2*(W*p2');
ep3 = -p3*(W*p3');

ep11 = -p11*(W*p11');
ep1, ep2, ep3, ep11

count =0;
for iter = 1:iterations
  for i = randperm(1024)
    count = count +1;
    p11(i) = sgn(dot(W(:,i), p1));
    ep11 = -p11*(W*p11');
    if(mod(count, 100) == 0)
      vis(p11);
      %ep11
      pause(.05);
    endif
  endfor
endfor