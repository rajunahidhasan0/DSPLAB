clc
clear all
close all
t = 0:0.001:1; %upto 1000 samples
vm = input('Enter Amplitude (Message) = ');
vc = input('Enter Amplitude (Carrier) = ');
fM = input('Enter Message frequency = ');
fc = input('Enter Carrier frequency = ');
m = input('Enter Modulation Index = ');
msg = vm*sin(2*pi*fM*t);
subplot(3,1,1); %plotting message signal
plot(t,msg);
xlabel('Time');
ylabel('Amplitude');
title('Message ');

carrier = vc*sin(2*pi*fc*t);
subplot(3,1,2); %plotting carrier signal
plot(t,carrier);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');

y = vc*sin(2*pi*fc*t+m.*cos(2*pi*fM*t));

subplot(3,1,3); %plotting FM (Frequency Modulated) signal
plot(t,y); 
xlabel('Time');
ylabel('Amplitude');
title('FM Signal');
