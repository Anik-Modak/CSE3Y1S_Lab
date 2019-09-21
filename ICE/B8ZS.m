clear;
bits = [1 0 0 0 0 0 0 0 0 0 0];

prompt = 'What is the voltage? ';
voltage = input(prompt);

sign = 1;
tmp = voltage;
len = length(bits);
time = 0 : len;

cnt = 0;
for i = 1 : len
    if(bits(i)== 0)
        cnt = cnt + 1;
        if(cnt == 8)
            bits(i) = -1;
            cnt = 0;
        end
    else
        cnt = 0;
    end
end

voltage = tmp*sign;
pbit = [0 0 0 tmp -tmp 0 -tmp tmp];
nbit = [0 0 0 -tmp tmp 0 tmp -tmp];
result = zeros(len+1, 1);

i = 1;
while(i <= len)
    if(bits(i)==1)
        result(i) = voltage;
        voltage = -voltage;
    elseif(bits(i)==0)
        result(i) = 0;
    else
        bits(i) = 0;
        if(voltage > 0)
            result(i-7:i) = nbit;
        else
            result(i-7:i) = pbit;
        end
    end
    i = i + 1;
end

stairs(time, result);
axis([0 len -tmp*2 tmp*2]);

%decoding
de_bits = zeros(1,len);
tmp = -1;
id  = 0;

i = 1;
while(i <= len)
    if tmp == result(i)
        tmp = -1;
        i = id + 8;
    elseif(result(i) == 0)
        de_bits(i) = 0;
    else
        id = i;
        tmp = result(i);
        de_bits(i) = 1;    
    end 
    i = i + 1;
end

disp(bits);
disp('Demodulation : ');
disp(de_bits);
