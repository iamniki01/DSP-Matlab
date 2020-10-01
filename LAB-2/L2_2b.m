M = 1000;
N = 100;
temp =0;
x1= rp1(M,N);
x2= rp2(M,N);
x3= rp3(M,N);

m1= mean(x1);
m2= mean(x2);
m3= mean(x3);

for i= 0 : M
   X1= rp1(i,N);
   X2= rp2(i,N);
   X3= rp3(i,N);

   M1= mean(X1);
   M2= mean(X2);
   M3= mean(X3);
   v1=(X1-M1).^2;
   v2=(X2-M2).^2;
   v3=(X3-M3).^2;
   V1=v1+temp;
   V2=v2+temp;
   V3=v3+temp;
 end;
 V1f = mean(V1);
 V2f = mean(V2);
 V3f = mean(V3);
 figure;
subplot(2,1,1);
plot(m1, 'r', m2,'*--g' ,m3,'b');
title('Mean value');
legend('m1', 'm2','m3');
subplot(2,1,2);
plot(V1f,'r', V2f,'b', V3f,'*--g'); 
title('variance value');
legend('V1f', 'V2f','V3f');

%this is not stationary. the mean value is constantly increasing.