N = 10000;
x = rand(N, 1);
m = mean(x);
var = mean(x.^2 - m.^2);

xbin = [0.025:0.05:0.975];

n = hist(x, xbin);
alpha= 1/(N * (8.854*10^(-12)));
f = alpha * n;
bar(xbin, f);
title('PDF of uniform distribution, N=10000')