clear
bits = [0,1,0,0,1,1,1,0];

prompt = 'What is the voltage? ';
voltage = input(prompt);

bitrate = 1;
Time=length(bits);

sampling_frequency = 100;
time = 0:bitrate/sampling_frequency:Time;

x = 1;
rate = -voltage;

for i = 1 :length(time)
    y_value(i) = rate;
    if time(i)>x
        x= x+1;
        if(bits(x)==1)
            rate= -voltage*flag;
        else
            rate = voltage*flag;
        end
    end
    flag = rate/voltage;
end

plot(time,y_value);
axis([0 Time+1 -2*voltage 2*voltage]);

x = 1;
in = 1;
tmp = -1;
for j=1:length(time)
  dm(x) = y_value(j)/voltage;
  if time(j)*bitrate>=x 
      if dm(x)==tmp
        ans_bits(in)=0;
      else 
        ans_bits(in)=1;
      end 
      
      tmp=dm(x);
      x=x+1;
      in= in+1;
  end
 end

title('NRZ-I');
disp(bits);
disp('Demodulation : ');
disp(ans_bits);


