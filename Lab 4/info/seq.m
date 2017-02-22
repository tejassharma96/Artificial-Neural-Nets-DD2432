iterations = 5;

pict;
W = p1'*p1 + p2'*p2 + p3'*p3;
%vis(p11);
count =0;
for iter = 1:iterations
  for i = randperm(1024)
    %r = 1 + (1024-1).*randperm(1,1);
    %r = int64(r);
    count = count +1;
    p11(i) = sgn(dot(W(:,i), p1));
    if(mod(count, 100) == 0)
      vis(p1);
      pause(.05);
    endif
  endfor
endfor

%vis(p11);
