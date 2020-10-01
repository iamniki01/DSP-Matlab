A = load('data_a.mat');

% t1 = A.A';
% t2 = (A.A).';

x  = (A.A).' * A.b;

e = A.A * x - A.b;

sos = e' * e;