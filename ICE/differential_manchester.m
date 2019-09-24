clc;
clear;
close all;

bits = [0,1,0,0,1,1];
voltage = input("Enter the amplitude: ");
bit_rate = input("Enter the bit_rate: ");

pre_vol = 1;
amp = pre_vol * voltage;
len = length(bits);
Time = len/bit_rate;
sampling_frquency = 10000;

in = 1;
for i = 1:len
  if bits(i) == 1
    amplitude(in) = amp;
    amplitude(in+1) = -amp;
    amp = amplitude(in+1);
  else
    amplitude(in) = -amp;
    amplitude(in+1) = amp;
    
  end
  in = in + 2;
end
  
%Modulation
bit_rate = bit_rate * 2;
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
title('Differential Manchester');
grid on;

%Demodulation
st = 1;
in = 1;
x = 1;
for i = 1:length(time)
  if bit_rate * time(i) >= x
    if mod(in, 2)==1
      if(result(i) == pre_vol * voltage)
        ans_bits(st) = 1;
        pre_vol = - pre_vol;
      else
        ans_bits(st) = 0;
      end
      st = st + 1;
     end
    x = x + 1;
    in = in + 1;
  end
end

disp("Orginal bit : ");
disp(bits);

disp("Demodulation: ");
disp(ans_bits);
  




