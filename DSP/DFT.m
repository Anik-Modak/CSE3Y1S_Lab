clc;
clear;
close all;

fs = 8000;
ts = 1/fs;
N = 8;
n = 0:N-1;
x = sin(2*pi*1000*n*ts) + 0.5*sin(2*pi*2000*n*ts);

a = zeros(1,N);
b = zeros(1,N);
X_mag = zeros(1,N);
X_angle = zeros(1,N);
X_ps = zeros(1,N);

for m=0:N-1
  for i=0:N-1
    a(m+1) = a(m+1)+x(i+1)*cos(2*pi*i*m/N); %real part
    b(m+1) = b(m+1)-x(i+1)*sin(2*pi*i*m/N); %imaginary part
  endfor
  X_ps(m+1) = a(m+1)^2 + b(m+1)^2;
  X_mag(m+1) = sqrt(X_ps(m+1));
  X_angle(m+1) = atan(b(m+1)/a(m+1));
endfor

in = 0;
for i = 1:N/2
  if X_mag(i) > 0.001
    in = in + 1;
    Freq(in) = (i-1)*fs/N;
    Amp(in) = 2*X_mag(i)/N;
  end
end

m=0:N-1;
disp('Signal x(n): ');
disp(x);
subplot(3,2,1);
stem(m, x);
title('Signal Spectrum');

disp('Magnitude X_mag(m): ');
disp(X_mag);
subplot(3,2,2);
stem(m, X_mag);
title('Magnitude Spectrum');

disp('Phase X_angle(m): ');
disp(X_angle);
subplot(3,2,3);
stem(m, X_angle);
title('Phase Spectrum');

disp('Power X_ps(m): ');
disp(X_ps);
subplot(3,2,4);
stem(m, X_ps);
title('Power Spectrum');

m=1:in;
disp('Frequecny: ');
disp(Freq);
subplot(3,2,5);
stem(m, Freq);
title('Frequecny Spectrum');

disp('Amplitude: ');
disp(Amp);
subplot(3,2,6);
stem(m, Amp);
title('Amplitude Spectrum');


