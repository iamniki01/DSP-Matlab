b = firpm(20,[0,6/22,8/22,1],[1,1,0,0]);

for i = 1:1024
    x(i) = 0;
end
x(1) = 1;

y = filter(b,1,x);

figure;
stem([0:1:1023],y);
axis([0,50,-0.2,0.4]);

figure;
plot([0:1:1023]/1024,abs(fft(y)));
