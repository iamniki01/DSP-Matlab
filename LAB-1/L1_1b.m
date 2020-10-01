clc;
L = 16;
k0 = 4;

x = zeros(1, L);
x(k0) = 1;
k = 0:1:L-1;

subplot(2,1,1);
plot(k,x);
xlabel('TIME');
ylabel('unit impulse signal');
grid;

subplot(2,1,2)
stem(k,x);
xlabel('TIME');
ylabel('unit impulse signal');
grid;