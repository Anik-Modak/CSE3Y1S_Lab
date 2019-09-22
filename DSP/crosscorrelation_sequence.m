clc;
close all;

x=[2 -1 3 7 1 2 -3];
y=[1 -1 2 -2 4 1 -2 5];

fliplr(y);
n = length(x) + length(y)-1;
x=[x zeros(1,n-length(x))];
y=[y zeros(1,n-length(y))];
r=zeros(1,n);

for i=1 : n
    for j=1 : i
       r(i) = r(i) + x(j) * y(i-j+1);
    end
end

disp('Crosscorrelation Sequence r(n): ');
disp(r);


    






