clear;
bits = [1,0,0,1,1,0,1,0,1,0];

prompt = 'What is the voltage? ';
voltage = input(prompt);

prompt = 'What is the bit_rate? ';
bit_rate = input(prompt);

sign = -1;
tmp = voltage;
frequency = 1000;
Time = length(bits)/bit_rate;
dt = 1/frequency;
time = 0 : dt :Time;
voltage = tmp*sign;

for i=1 : length(bits)
    if (bits(i) == 0)
        y_level(i) = 0;
    else
        y_level(i) = -voltage;
        voltage = -voltage;
    end
end

x = 1;
for i = 1:length(time)
    result(i) = y_level(x);
    if time(i)*bit_rate>=x
        x= x+1;
    end
end

plot(time, result);
axis([0 Time -tmp*2 tmp*2]);

% demodulation
i=1;
in=1;
tmp=1*sign;
for j=1:length(time)
  dm(i) = result(j)/voltage;
  if time(j)*bit_rate>=i 
      if dm(i)==0
        ans_bits(in)=0;
      else 
        ans_bits(in)=1;
      end 
      tmp=dm(i);
      i=i+1;
      in= in+1;
  end
end

title('AMI');
disp('Orginal bits : ')
disp(bits);
disp('Demodulation : ')
disp(ans_bits)