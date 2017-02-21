% One step of clustering using Expectation Maximization Algorithm
% Needs initilisation: vqinit + initrbf
% variables needing init are:
% delta	: learning rate
% m	: unit positions (by initrbf)
% var	: unit variances (by initrbf)
% 
% The algorithm works in a competetive way
% 


i=rows(data);
dims=cols(m);
oldm=m;
oldvar=variance;
oldetha=etha;

%plotbuffer(pd);
m=m*0;
variance=variance*0;
etha=etha*0;
%variance=variance*0+0.001;
variance=variance*0+0.0001;

dims=cols(m);
while i>0
  %find distance and difference between all unit positions and the data point
  [sqdst df]=sqdist(oldm,data(i,:));
  %Calculate response from gaussian RBF units and its summed activity
  pxwunit = ngauss(sqdst,oldm,oldvar);
  pxwunits = sum(pxwunit);
  act=pxwunit/pxwunits;
  if singlewinner>0
    [amax ai]=max(act);
    act=act*0+0.0001;
    act(ai)=1;
  end;
  etha=etha+act;
  m=m+act*data(i,:);
  variance=(variance+act*(data(i,:)*data(i,:)'));
  i=i-1;
end
m=divvec(m,etha);
variance=((variance./etha)-mulrows(m,m))/dims;
etha=etha/sum(etha);

%ploterase(pd);
clf;
plotdata2(h,data);
plotrbf2(h,m,variance,p1,p2);
%plotlines(pd,m,oldm,p1,p2);
%plotrefresh(pd);
