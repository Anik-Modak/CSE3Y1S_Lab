clear;

x=[1,3,5,7,9];

result = 0;
z = sym('z');

for i = 0 : length(x) - 1
    result = result + x(i+1) * z^(-i);
end;

disp('Displying output without building function: ');
disp(result);
z = ztrans(result);


