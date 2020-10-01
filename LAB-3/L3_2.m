clc;
N = 10000;
index=0;
jindex =0;
SNR_dB =0:1:14;
 Qam_Real = [-1,1,-1,1];
    Qam_Img = [1,1,-1,-1];
    QAM = (Qam_Real + j*Qam_Img);
    avgQ = sum((abs(QAM)).^2)/length(QAM);
    QAMN = QAM/sqrt(avgQ);
    b=randi([0,3],1,N);
    a = QAMN(b+1);
    symbol_Conste = QAMN;
    
    
for SNR_db = 0: 1: 14
        
SNR_lin = 10 ^ (SNR_db/10);
var_n = 1/SNR_lin;
h = sqrt(1/2) * (randn(size(a)) + j * randn(size(a)));
n = sqrt(var_n/2) * (randn(size(a)) + j * randn(size(a)));
% Receiver
r =  h .* a + n ;
r1 = a + n ;
u= r .* (exp(-j * angle(h)));
%a_hat(length(r)) = 0;


for i = 1: length(r)
  a_hat(i)=0;
  a_hat1(i)=0;
  b_hat(i)=0;
  b_hat1(i)=0;
  end;
b_err = 0;
b_err1 = 0;
for i = 1: length(r)
    for k = 1: length(QAMN)
        d(k)= abs(u(i)-abs(h(i))*QAMN(k)).^2;
        d1(k)= abs(r1(i)-QAMN(k)).^2;
    end;
    [m,k] = min(d);
    [z,l] = min(d1);
     a_hat(i) = QAMN(k);
     a_hat1(i) = QAMN(l);
     b_hat(i) = k -1;
     b_hat1(i)=l-1;
     
    dif1 =  abs(b(i) - b_hat1(i));
    dif =  abs(b(i) - b_hat(i));
     if(dif > 0)
          b_err = b_err + 1;
     end;
     if(dif1 > 0)
     b_err1 = b_err1 + 1;
     end;
end

index = index + 1;
ber(index) = b_err / length(b);
figure (1);
semilogy(SNR_db, ber(index), 'b--o');
hold on;
jindex = jindex + 1;
ber1(jindex) = b_err1/length(b);
figure(1);
semilogy(SNR_db, ber1(jindex), 'r--o');
hold on;
figure(1);
theoryBerAWGN = 0.5*erfc(sqrt(10.^(SNR_db/10)));
semilogy(SNR_db,theoryBerAWGN,'g--o');
hold on;
title(' curve for Bit Error Rate VS. SNR for 4-QAM in AWGN, Theoretical AWGN,Rayleigh');
xlabel(' SNR(dB)');
ylabel('BER');
legend('Raylegh BER','AWGN BER', 'Theoretical AWGN ');


%title(' curve for Bit Error Rate VS. SNR for 4-QAM in AWGN channel');
%xlabel(' SNR(dB)');
%ylabel('BER');
%hold on;
end
