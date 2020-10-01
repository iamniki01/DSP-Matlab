clc;

N = 10000;
index=0;
%SNR_db =0:1:14
Choose_mod = 'Choose 1 for BPSK, 2 for 4QAM, 3 for 16QAM';
sprintf('\n');
modulation = input(Choose_mod);



if (modulation == 1)
     symbol_Conste = [-1,1];
     QAMN = 1;
     b=randi([0,1],1,N);
     a = symbol_Conste(b+1);
 
  
elseif(modulation == 2)
    Qam_Real = [-1,1,-1,1];
    Qam_Img = [1,1,-1,-1];
    QAM = (Qam_Real + j*Qam_Img);
    avgQ = sum(abs(abs(QAM)).^2)/length(QAM);
    QAMN = QAM/sqrt(avgQ);
    b=randi([0,3],1,N);
    a = QAMN(b+1);
    symbol_Conste = QAMN;


elseif (modulation == 3)
   Qam_16Real = [-1,-1,-3,-3,1,1,3,3,-1,-1,-3,-3,1,1,3,3];
   Qam_16Img  = [1,3,1,3,1,3,1,3,-1,-3,-1,-3,-1,-3,-1,-3];
   QAM = (Qam_16Real + (j*Qam_16Img));
   avgQ = sum(abs(abs(QAM)).^2)/length(QAM);
   QAMN = QAM/sqrt(avgQ);
   b=randi([0,15],1,N);
   a=QAMN(b+1);
   symbol_Conste = QAMN;
end
for SNR_db = 0: 1 : 14
        
SNR_lin = 10 ^ (SNR_db/10);
var_n = 1/SNR_lin;
n = sqrt(var_n/2) * (randn(size(a)) + j * randn(size(a)));
% Receiver
r = a + n ;
%a_hat(length(r)) = 0;


for i = 1: length(r)
  a_hat(i)=0;
  b_hat(i)=0;
end;
b_err = 0;
for i = 1: length(r)
    for k = 1: length(QAMN)
        d(k)= abs(r(i)-QAMN(k)).^2;
    end;
    [m,k] = min(d);
     a_hat(i) = QAMN(k);
     b_hat(i) = k -1;
       
    dif =  abs(b(i) - b_hat(i));
     if(dif > 0)
          b_err = b_err + 1;
     end;
end

index = index + 1;
ber(index) = b_err / length(b);

figure(1);
semilogy(SNR_db, ber(index), '--bo');
figure(1);
title(' curve for Bit Error Rate VS. SNR for BPSK over AWGN and AWGN' );
xlabel(' SNR(dB)');
ylabel('BER');
hold on;
end
