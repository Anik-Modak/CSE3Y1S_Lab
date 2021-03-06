clc;
clear;
close all;

bits = [0,1,0,0,1,1,1,0];
voltage = input("Enter the amplitude: ");
bit_rate = input("Enter the bit_rate: ");

pre_vol = 1;
amp = pre_vol * voltage;
len = length(bits);
Time = len/bit_rate;
sampling_frquency = 10000;

for i = 1:len
  if bits(i) == 1
    amplitude(i) = - amp;
    amp = amplitude(i);
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
axis([0 Time -voltage*1.5 voltage*1.5]);
grid on;
title('AMI');

%Demodulation
x = 1;
for i = 1:length(time)
  if bit_rate * time(i) >= x
    tmp = result(i)/voltage;
    if tmp == 0
      ans_bits(x) = 0;
    else
      ans_bits(x) = 1;
    end
    x = x + 1;
  end
end

disp("Orginal bit : ");
disp(bits);

disp("Demodulation: ");
disp(ans_bits);
  




