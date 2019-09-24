clc;
clear;
close all;

Am = input('Enter Amplitude (Message) = ');
Ac = input('Enter Amplitude (Carrier) = ');
fm = input('Enter Message frequency = ');
fc = input('Enter Carrier frequency = ');
m = input('Enter Modulation Index = ');%10

t = 0:0.001:01; %upto 1000 samples
msg = Am*sin(2*pi*fm*t);

subplot(3,1,1);
plot(t,msg);
xlabel('Time');
ylabel('Amplitude');
title('Message ');

carrier = Ac*sin(2*pi*fc*t);
subplot(3,1,2);
plot(t,carrier);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');

y = Ac*sin(2*pi*fc*t+m*sin(2*pi*fm*t));
subplot(3,1,3);
plot(t,y,'r');
xlabel('Time');
ylabel('Amplitude');
title('FM Signal');