clear

bits = [0,1,1,0,1,0,1,0,1,1,1,1];
temp=2;
amplitude(1)=2;
for i = 2:length(bits)
    if(bits(i)==1) 
        if(amplitude(i-1)==2)
            amplitude(i) = -2;
            temp=-2;
        else 
            amplitude(i) = 2;
            temp=2;
        end
    else
        amplitude(i) = amplitude(i-1);  
    end
    
end

amplitude
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
axis([0 Time -4 6]);


% demodulation
x = 1;

for i = 1:length(time)
    if time(i)>x
        x = x + 1;
        ans_bits(x) = 1;
        if(y_value(i)>0)
            ans_bits(x) = 0;
        end
        %ans_bits(x) = y_value(i);
    end
end

disp('Demodulation : ')
disp(ans_bits)


