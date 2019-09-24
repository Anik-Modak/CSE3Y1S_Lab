clc;
clear;
close all;

bits = [0,1,1,0,1,0,1,0,1,1,1,0];
amp = input("Enter the amplitude: ");
bit_rate = input("Enter the bit_rate: ");

len = length(bits);
Time = len/bit_rate;
sampling_frquency = 10000;

for i = 1:len
  if bits(i) == 1
    amplitude(i) = amp;
  else
    amplitude(i) = 0;
  end
end
  
%Modulation
time = 0: 1/sampling_frquency:Time;
x = 1;
for i = 1:length(time)
  result(i) = amplitude(x);
  if bit_rate * time(i) >= x;
    x = x + 1;
  end
end

plot(time, result, 'Linewidth', 2);
axis([0 Time 0 amp+2]);
title('Unipolar NRZ');
grid on;

%Demodulation
x = 1;
for i = 1:length(time)
  if bit_rate * time(i) >= x
    ans_bits(x) = result(i)/amp;
    x = x + 1;
  end
end

disp("Orginal bit : ");
disp(bits);

disp("Demodulation: ");
disp(ans_bits);
  




