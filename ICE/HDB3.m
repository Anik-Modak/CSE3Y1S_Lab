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
    
    if zero > 3
        if mod(one, 2)==0
            y_level(i) = -voltage;
            voltage = y_level(i);
            y_level(i-3) = voltage;
        else
            y_level(i) = voltage;
        end
        zero = one = 0;
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
title('HDB3');

%Demodulation
x = 1;
for i = 1:length(time)
  if bit_rate * time(i) >= x
    tmp = result(i)/amp;
    if tmp == 0
      ans_bits(x) = 0;
    else
      ans_bits(x) = 1;
      if tmp==pre_vol && x > 3
           ans_bits(x) = 0;
           ans_bits(x-3) = 0;
      end 
    end
    
    if tmp ~= 0
      pre_vol = tmp;
    end
    x = x + 1;
  end
end

disp("Orginal bit : ");
disp(bits);

disp("Demodulation: ");
disp(ans_bits);
  




