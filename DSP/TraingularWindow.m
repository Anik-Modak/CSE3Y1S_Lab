clc;
clear;
close all;

N = 20;
n = 0:1:N-1;

i = 1;
for n = 0:N/2;
  w(i) = n/(N/2);
  i = i + 1;
endfor

for n = N/2+1 : N-1;
  w(i) = 2 - n/(N/2);
  i = i + 1;
endfor

n = 0:1:N-1;
plot(n, w);
title('Traingular Window');
