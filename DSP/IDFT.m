clc;
clear;
close all;

X = [0 2 0 2];
N = 4;

x1 = zeros(1,N);
for n = 1:N
    for m = 1:N
        x1(n) = x1(n) + (1/N)*(X(m)*exp(2*j*pi*(n-1)*(m-1)/N));
    end
end

disp('Inverse DFT x1(n): ');
disp(real(x1));

n = 0:N-1;
subplot(2,1,1);
stem(n, real(x1));
title('Inverse DFT x(n)');

x2 = real(ifft(X));
disp('Inverse DFT x2(n): ');
disp(x2);

subplot(2,1,2);
stem(n, x2);
title('Inverse DFT x(n)');







