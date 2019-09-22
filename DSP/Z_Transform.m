clc;
close all;

z = sym('Z');
x = input("Enter the sequence x(n): ");
id = input("Enter the starting index: ");
len = id + length(x) - 1;

n = 1;
result = 0;
for i = id : len
  result = result + x(n)*(z^(-i));
  n = n + 1;
endfor

disp('Displying output Z-transform of x(n): ');
disp(result);

