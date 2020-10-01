%Cauer lowpass flter

[b,a] = ellip(5,0.5,40,7/22);

for i = 1:1024
    x(i) = 0;
end
x(1) = 1;

y = filter(b,a,x);

figure;
subplot(2,1,1);
stem([0:1:1023],y);
axis([0,50,-0.2,0.4]);
title('Time signal');

subplot(2,1,2);
plot([0:1:1023]/1024,abs(fft(y)));
title('Magnitude');