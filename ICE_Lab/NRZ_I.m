clc;

bits = [0,1,1,0,1,0,1,0,1,1,1,1];
temp=2; 
vl=5;
bitrate = .5;
Time=length(bits) ;
sampling_frequency = 1500;

time = 0:bitrate/sampling_frequency:Time;
amplitude(1)=vl;

for i = 1:length(time)
    y_value(i)= amplitude(x);
     if time(i)>=x-.5
      y_value(i)=0;
    end
    if time(i)>=x
        x= x+1;
    end
end

amplitude

plot(amplitude);


