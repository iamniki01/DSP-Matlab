L =  32;
N = 20000;
x1 = rand(N,1);
x2 = randn(N,1);
b = ones(1,L)/L;
a = [1,zeros(1,L-1)];
[H,Om]=freqz(b,a);
figure;
plot(Om ,abs(H));
title('frequency magnitude response')
% DC transfer factor H0 = H(1) = 1

y1=filter(b,a,x1);
y2=filter(b,a,x2);