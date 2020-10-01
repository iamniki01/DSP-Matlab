N = 10000;
for i=1:12
x = rand(N,i);
% variance of x isn't workig bx x is of size 10000*12
% Need to convert it to 10000 * 1
m_x = mean(x);
var_x = mean(x.^2 - m_x.^2);
end;
xsum = sum(x')';
m_xsum = mean(xsum);
var_xsum = mean(xsum.^2 - m_xsum.^2);


xbin = [0:0.2:9.8];

n = hist(xsum, xbin);
alpha= 1/(N * (8.854*10^(-12)));
f = alpha * n;
bar(xbin, f);
title('PDF-xsum');