clc;
clear;
close all;

bits = [ 1 1 0 0 0 0 0 0 0 0 0 0 0 1];
amp = input("Enter the amplitude: ");
bit_rate = input("Enter the bit_rate: ");

pre_vol = 1;
voltage = pre_vol * amp;
len = length(bits);
Time = len/bit_rate;
sampling_frquency = 10000;

zero = 0;
one = 0;
for i = 1:len
    if bits(i) == 0
        zero = zero + 1;
    else
        one = one + 1;
        zero = 0;
    end
    
    if zero > 7
        y_level(i-4) = voltage;
        y_level(i-3) = -voltage;
        y_level(i-1) = -voltage;
        y_level(i) = voltage;
        zero = 0;
    elseif bits(i)==0
        y_level(i) = 0;
    else 
        y_level(i) = -voltage;
        voltage = y_level(i);
    end
end
  
%Modulation
time = 0: 1/sampling_frquency:Time;
x = 1;
for i = 1:length(time)
  result(i) = y_level(x);
  if bit_rate * time(i) >= x;
    x = x + 1;
  end
end

plot(time, result, 'Linewidth', 2);
axis([0 Time -amp*2 amp*2]);
grid on;
title('B8Z3');

%Demodulation
x = 1;
for i = 1:length(time)
  if bit_rate * time(i) >= x
    tmp = result(i)/amp;
    if tmp == 0
      ans_bits(x) = 0;
    else
      if tmp==pre_vol    
          ans_bits(x+1) = 0;
          ans_bits(x+2) = 0;
          ans_bits(x+3) = 0;
          ans_bits(x+4) = 0;
          x = x + 4;
      else
          ans_bits(x) = 1;
          pre_vol = tmp;
      end 
    end
    x = x + 1;
  end
end

disp("Orginal bit : ");
disp(bits);

disp("Demodulation: ");
disp(ans_bits);
  




