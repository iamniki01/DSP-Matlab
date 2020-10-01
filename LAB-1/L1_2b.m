x = [ones(1,4),zeros(1,28)];

X = fft(x);

figure 1;
subplot(2,1,1);
stem([0:1:31], abs(X));
title('Magnitude');
%xlablel('Time');
%ylabel('absolute value of fft');

subplot(2,1,2);
stem([0:1:31], -angle(X));
title('Phase');
%xlablel('Time');
%ylabel('Phase of fft');

