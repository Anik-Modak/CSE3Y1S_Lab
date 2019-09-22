clc;
clear;
close all;

L = 20;
n = 1:L
for i = 1:L
  w(i) = 1;
endfor

plot(n, w);
title('Rectangal Window');
#wvtool(rectwin(L));
