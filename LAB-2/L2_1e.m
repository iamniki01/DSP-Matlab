clc;
close all;
N = 10000;
x = randn(N, 1);
m = mean(x);
var = mean(x.^2 - m.^2);

xbin = [-3.4:0.2:3.4];

n = hist(x, xbin);
alpha= 1/(N * (8.854*10^(-12)));
f = alpha * n;
bar(xbin, f);
title('PDF-Normal distribution')