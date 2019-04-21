

fs = 1000;
a = 10;
T = 2;
f = 2;

t = 0:1/fs:T;

a1 = 10;
f1 = 4;

a2 = 10
f2 = 8

ara := (1..18)
ara(1) = 2;

for i = 1:1:18
    ara(i) = ara(i-1)*2;
end

var;

for i = 1:1:18
    var = var + a * sin(2*pi*ara(i)*t);
end

y = a * sin(2*pi*f*t)
y1 = a1 * sin(2*pi*f1*t)
y2 = a2 * sin(2*pi*f2*t)

%plot(t,y+y1+y2)

plot(t,var)
