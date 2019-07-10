clc;
clear;

bits = [0,1,1,0,1,0,1,0,1,1,1,1];
%bits = [0,1,0,0,1];
vl=5;
for i = 1:length(bits)
    if(bits(i)==1) 
        amplitude(i) = -vl;
    else 
        amplitude(i) = vl;
    end    
end



bitrate = 1;
Time=length(bits);

sampling_frequency = 200;

time = 0:bitrate/sampling_frequency:Time;

x = 1/bitrate;
j=1;
for i = 1:length(time)
    if(bits(j)==1) y_value(i)= -vl;
    else y_value(i)= vl;
    end
     if time(i)>=x-(1/(2*bitrate))
        if(bits(j)==1) y_value(i)= vl;
        else y_value(i)= -vl;
        end
    end
    if time(i)>=x
        x= x+(1/bitrate);
        j=j+1;
    end
end
     

plot(time, y_value);
axis([0 Time -6 6]);


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
