clear;

bits = [0,1,0,0,1,1];

prompt = 'What is the voltage? ';
voltage = input(prompt);

prompt = 'What is the bit_rate? ';
bit_rate = input(prompt);

sign = 1;
tmp=voltage;
in = 1;
voltage = sign*voltage;

for i = 1:length(bits)
    if(bits(i)==0)
        y_level(in) = -voltage;
        y_level(in+1) = voltage;
    else
        y_level(in) = voltage;
        y_level(in+1) = -voltage;
        voltage = -voltage;
    end
    in = in + 2;
end


frequency = 1000;
voltage=tmp;
bit_rate = bit_rate*2;
Time = length(bits)*2/bit_rate;
dt = 1/frequency;
time = 0:dt:Time;

x = 1;
for i = 1:length(time)
    y_value(i)= y_level(x);
    if time(i)*bit_rate>=x
        x= x+1;
    end
end

plot(time,y_value);
axis([0 Time -voltage*2 voltage*2]);

% demodulation
i=1;
in=1;
st=1;
tmp=1*sign;

for j=1:length(time)
    dm = y_value(j)/voltage;
    if time(j)*bit_rate>=i
        if mod(in,2)==1
            if dm ~=tmp
                ans_bits(st)=0;
            else
                ans_bits(st)=1;
                tmp =  -tmp; %middle a trasition ghotlo
            end
            st = st + 1;
        end
        i=i+1;
        in= in+1;
    end
end

title('Differential-Manchester');
disp('Orginal bits : ')
disp(bits);
disp('Demodulation : ')
disp(ans_bits)