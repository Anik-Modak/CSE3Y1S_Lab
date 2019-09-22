clear;

N=12;
t=-6:1:(N-1)/2;

for i=1:length(t)
  if t(i)>=0
    x(i)=1;
  else
    x(i)=0;
  endif
endfor

subplot(2,2,1:2);
stem(t,x);
xlabel('t');ylabel('x(t)');
title('Unit Step Sequence');

t=t+2;
subplot(2,2,3);
stem(t,x);
xlabel('t');ylabel('x(t)');
title('Shift Operation');

for i=1:length(t)
  if t(i)<=0
    y(i)=1;
  else
    y(i)=0;
  endif
endfor

subplot(2,2,4);
stem(t,y);
xlabel('t');ylabel('y(t)');
title('Reverse');