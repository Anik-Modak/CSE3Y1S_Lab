clear;
data = [0,0,0,0,1,0];

k=1;
t=0;
bitrate=0.5;
sign = 1;
Time=length(data);
samplesize = 100000;

prompt = 'What is the voltage? ';
voltage = input(prompt);

for j=1:length(data)
    for i=0:(1/samplesize):bitrate/2.0
        time(k) = i+t;
        if data(j)== 1
            result(k) = -sign * voltage;
        else
            result(k) = sign * voltage;
        end
        k = k+1;
    end
    for p=i:1/samplesize:bitrate
        time(k)=t+p;
        result(k)=0;
        k=k+1;
    end
    t= time(k-1);
end;

title('RZ');
plot(time,result);
axis([0 Time -2*voltage 2*voltage]);

% demodulation
x = 1;
in = 1;
for i = 1:length(time)
    if time(i) > x*bitrate
        x = x + 1;
        if result(i)/voltage>0
            ans_bits(x)=0;
        else
            ans_bits(x)=1;
        end
    end
end;

disp(data);
disp('Demodulation : ')
disp(ans_bits);