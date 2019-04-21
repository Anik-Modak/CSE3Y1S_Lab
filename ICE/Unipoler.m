clear


bits = [0,1,1,0,1,0,1,0,1,1,1,1];

for i = 1:length(bits)
    if(bits(i)==1) 
        amplitude(i) = 3;
    else 
        amplitude(i) = 0;
    end
    
end



bitrate = 1;
Time=length(bits);

sampling_frequency = 150;

time = 0:bitrate/sampling_frequency:Time;

x = 1;

for i = 1:length(time)
    y_value(i)= amplitude(x);
    if time(i)>=x
        x= x+1;
    end
end
     

plot(time,y_value);
axis([0 Time -1 6]);


% demodulation
x = 1;

for i = 1:length(time)
    if time(i)>x
        x = x + 1;
        ans_bits(x) = y_value(i)/3;
    end
end

disp('Demodulation : ')
disp(ans_bits)


