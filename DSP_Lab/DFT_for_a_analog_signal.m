%Given Signal::   x(t) = sin(2*pi*1000*t) + 0.5*sin(2*pi*1000*t + 3*pi/4)
clc;
clear;

N=8;
F1=1000;
F2=2000;
fs=8000;

n=0:N-1;
x = sin(2*pi*n*F1/fs) + 0.5*sin(2*pi*n*F2/fs + 3*pi/4);

X = zeros(8,1);
Y = zeros(8,1);
Angle=zeros(8,1);
amp=zeros(8,1);
mag=zeros(8,1);
for k = 0:N-1
    for n = 0:N-1
       X(k+1) = X(k+1) + x(n+1)*(cos((2*pi*n*k)/N));
       Y(k+1) = Y(k+1) + x(n+1)*(sin((2*pi*n*k)/N));
    end
    amp(k+1)=sqrt(X(k+1)*X(k+1) + Y(k+1)*Y(k+1));
    mag(k+1)=amp(k+1)*amp(k+1);
    Angle(k+1)=atan(Y(k+1)/X(k+1));   
end

t = 0:N-1;
subplot(221)
stem(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time domain - Input sequence')


subplot(222)
stem(t,amp);
xlabel('Frequency');
ylabel('Amp');
title('Frequency domain - Magnitude response')

subplot(223)
stem(t,Angle);
xlabel('Frequency');
ylabel('Amp*Amp');
title('Power Spectrum')

subplot(224)
stem(t,Angle);
xlabel('Frequency');
ylabel('Phase');
title('Frequency domain - Phase response')

amp         % to check |X(k)|
Angle  % to check phase