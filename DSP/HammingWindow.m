clc;
clear;
close all;

Length = 0:1:1000;
N = 100;
i = 0;

for n = 0:1:1000
  i = i+1;
  if n >= 0 && n <= N
      w(i) = 0.54 - 0.46*cos(2*pi*n/N);
  endif
endfor

disp(w);
index = 0:1:N;
plot(index, w);