clc;
clear;
close all;

bits = [0,1,0,0,1,1,1,0];
amp = input("Enter the amplitude: ");
bit_rate = input("Enter the bit_rate: ");

sign = -1;
len = length(bits);
Time = len/bit_rate;
sampling_frquency = 10000;

for i = 1:len
  if bits(i) == 1
    amplitude(i) = sign * amp;
  else
    amplitude(i) = amp;
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
axis([0 Time -1.5*amp amp*1.5]);
grid on;
title('NRZ_L');

%Demodulation
x = 1;
for i = 1:length(time)
  if bit_rate * time(i) >= x
    if(result(i) < 0)
      ans_bits(x) = 1;
    else
      ans_bits(x) = 0;
    end
    x = x + 1;
  end
end

disp("Orginal bit : ");
disp(bits);

disp("Demodulation: ");
disp(ans_bits);
  




