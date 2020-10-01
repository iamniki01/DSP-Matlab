b= randi([0,1], 1, 10000);
BPSK = [-1, 1];
%avgP = sum(abs(BPSK).^2)/length(BPSK);

a = BPSK(b+1); % To adjust index as index starts from 1 in MatLab
index = 0;
% Generate noise
for SNR_db = 0: 1 : 14
        
SNR_lin = 10 ^ (SNR_db/10);
var_n = 1/SNR_lin;
n = sqrt(var_n/2) * (randn(size(a)) + j * randn(size(a)));
% Receiver
r = a + n;
a_hat(length(r)) = 0;

b_err = 0;
for i = 1: length(r)
    d = abs(r(i) - 1).^2;
    dm = abs(r(i) + 1).^2;
    
    if (d < dm)
        a_hat(i) = 1;
        b_hat(i) = 1;
    else
        a_hat(i) = -1;
        b_hat(i) = 0;
    end

    b_err = b_err + abs(b(i) - b_hat(i));
end

index = index + 1;
ber(index) = b_err / length(b);

semilogy(SNR_db, ber(index), 'b--o');
title(' curve for Bit Error Rate VS. SNR for BPSK modulation');
xlabel(' SNR(dB)');
ylabel('BER');
hold on;
end
