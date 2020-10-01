x= zeros(1,32) %unit impulse signal generation
x(1)= 1;
k = 0:1:31;

subplot(2,1,1);
stem(k,x);
xlabel('TIME')
ylabel('unit impulse signal')



subplot(2,1,2);
plot(k,x);
xlabel('TIME');
ylabel('unit impulse signal');