%x = [2 3 -1 4];
x=[1000 2000 3000 4000];
N = length(x);
X = zeros(4,1);
Y = zeros(4,1);
for k = 0:N-1
    for n = 0:N-1
        Y(k+1) = Y(k+1) + x(n+1)*exp(-j*pi/2*n*k);
       X(k+1) = X(k+1) + x(n+1)*(cos((pi/2)*n*k)-j*sin((pi/2)*n*k));
    end
end
%fft(x)
t = 0:N-1;
subplot(311)
stem(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time domain - Input sequence')

subplot(312)
stem(t,X);
xlabel('Frequency');
ylabel('|X(k)|');
title('Frequency domain - Magnitude response')

subplot(313)
stem(t,angle(X));
xlabel('Frequency');
ylabel('Phase');
title('Frequency domain - Phase response')

X         % to check |X(k)|
angle(X)  % to check phase