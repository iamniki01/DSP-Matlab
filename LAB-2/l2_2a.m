clc;
M= 4;
N= 100;
x1 = rp1(M,N);
x11 = x1(1,:);
x12 =  x1(2,:);
x13 =  x1(3,:);
x14 =  x1(4,:);


x2=rp2(M,N);
x21=x2(1,:);
x22=x2(2,:);
x23=x2(3,:);
x24=x2(4,:);


x3=rp3(M,N);
x31=x3(1,:);
x32=x3(2,:);
x33=x3(3,:);
x34=x3(4,:);

figure 1;
subplot(4,1,1);
plot(x11, 'r');
title("RP1");
subplot(4,1,2);
plot(x12, 'b');
subplot(4,1,3);
plot(x13, 'g');
subplot(4,1,4);
plot(x14, 'b');

figure 2;
subplot(4,1,1);
plot(x21, 'r');
title("RP2");
subplot(4,1,2);
plot(x22, 'b');
subplot(4,1,3);
plot(x23, 'g');
subplot(4,1,4);
plot(x24, 'b');

figure 3;
subplot(4,1,1);
plot(x31, 'r');
title('RP3');
subplot(4,1,2);
plot(x32, 'b');
subplot(4,1,3);
plot(x33, 'g');
subplot(4,1,4);
plot(x34, 'b');

