function x = rp2(M,N);      

Mr = rand(M,1)*ones(1,N);
Ar = rand(M,1)*ones(1,N);
x = (rand(M,N)-0.5).*Mr + Ar;