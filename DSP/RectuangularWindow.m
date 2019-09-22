clc;
clear;
close all;

L = 20;
n = 1:L
winr = [ones(1,L)];

stem(n,winr);
ylim([-2 2]);
#wvtool(rectwin(L));
