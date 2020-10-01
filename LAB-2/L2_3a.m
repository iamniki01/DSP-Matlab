N = 20000;
x1 = rand(N,1);
x2 = randn(N,1);
m1 = mean(x1);
m2 = mean(x2);
[phi1,lambda]=acf(x1,128);
[phi2,lambda]=acf(x2,128);
subplot(2,1,1);
plot(lambda, real(phi1));
title('ACF-with phi-1')
subplot(2,1,2);
plot(lambda, real(phi2));
title('ACF-with phi-2')