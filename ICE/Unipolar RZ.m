clc;
clear;

data = [1 1 0 1 1 0 1 0 0 0 0 1 0];
k=1;
t=0;
bitrate=2;
voltagelevel = 5;
samplesize = 100000;
for j=1:length(data)
      for i=0:(1/samplesize):bitrate/2
       time(k) = i+t;
        if data(j)==1
            result(k)=voltagelevel;
         else result(k)=-voltagelevel;
      
         end;
        k = k+1;
  
        end;
         
        
      for p=i:1/samplesize:bitrate
        time(k)=t+p;
        result(k)=0;
        k=k+1;
    end;
     t= time(k-1);
end;
   
 plot(time,result);