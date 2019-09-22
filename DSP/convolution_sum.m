clc;
close all;

x=[3 2 1 2];
h=[1 2 1 2];

startx = input("Enter the starting index of x(n): ");
endx = startx + length(x) - 1;
infx = startx:1:endx;

starth = input("Enter the starting index of h(n): ");
endh = starth + length(h) - 1;
infh = starth:1:endh;

subplot(2, 2, 1);
stem(infx, x);
title('x(n)');

subplot(2, 2, 2);
stem(infh, h);
title('h(n)');

n = length(x) + length(h) - 1;
x=[x zeros(1,n-length(x))];
h=[h zeros(1,n-length(h))];
y=zeros(1,n);

for i=1 : n
    for j=1 : i
        y(i) = y(i) + x(j) * h(i-j+1);
    end
end


disp('Convolution Sum: ');
disp(y);

starty = startx + starth;
endy = starty + length(y) - 1;
infy = starty:1:endy;
subplot(2, 2, 3:4);
stem(infy, y);
title('y(n)');
