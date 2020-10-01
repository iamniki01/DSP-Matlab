M = 10;
N = 1000;
temp=0;
x1=rp1(10,1000);
x2=rp2(10,1000);
x3=rp3(10,1000);
m1=mean(x1.').';
m2=mean(x2.').';
m3=mean(x3.').';
for i= 0 : M
 % for j= 0 : N
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
subplot(2,1,1);
plot(M1, 'r' ,M2, 'o-b' ,M3,'g');
title('Mean value');
legend('RP1', 'RP2','RP3');
subplot(2,1,2);
plot(m1,'o-r', m2,'+-b', m3,'*-g'); 
title('Linear time mean for random process');
legend('RP1', 'RP2','RP3');



%This is ergodicity, since all values of time is in the same row. 