B = load('data_b.mat');

x  = (B.A).' * B.b;

e = B.A * x - B.b;
sos = e' * e;