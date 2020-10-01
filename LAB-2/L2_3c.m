L =  32;
N = 20000;
x1 = rand(N,1);
x2 = randn(N,1);
b = ones(1,L)/L;
a = [1,zeros(1,L-1)];
y1=filter(b,a,x1);
y2=filter(b,a,x2);
[phi1,lambda]=acf(y1,128);
[phi2,lambda]=acf(y2,128);
figure 1;
subplot(2,1,1);
plot(lambda, real(phi1));
title('ACF -Phi1');
subplot(2,1,2);
plot(lambda, real(phi2));
title('ACF -Phi2');

%histogram comparision
epsilon = 8.854 * 10.^-12;
alpha = (1/N)*epsilon;
ybin1=[0:0.01:1]; %Normalization
ybin2=[-1:0.05:1];
n1=hist(y1,ybin1);
n2=hist(y2,ybin2);
f1=alpha*n1;
f2=alpha*n2;
figure 2;
subplot(2,1,1);
bar(ybin1,f1);
title('PDF-f1');
subplot(2,1,2);
bar(ybin2,f2);
title('PDF-f2');