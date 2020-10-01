function [ak,la] = acf(x,m,w);
% function [ak,la] = akf(x,m [,w]);
%
% Calculation of the (complex valued) autocorrelation sequence
% in frequency domain based on the algorithm of Ch. M. Rader
%
% ak : autocorrelation
% la : lambda-values
% x  : input sequence
% m  : ACF-length ( = FFT-length)
% w  : Hanning-windowing of ACF-values, if call with 3 arguments
%


if nargin < 1; error('usage: akf(x,m) OR akf(x,m,w)'); end;
if nargin == 1; m = 100; end;

x=x(:).';
m2 = m/2;
in = 1:m2;
im = fix(length(x)/m)-1;
mu = (-1).^(0:m-1);
ak = zeros(1,m);
z  = fft(x(in),m);
for i=1:im;
   zi = fft(x(in+i*m),m);
   ak = ak + conj(z).*( z + mu.*zi );
   z  = zi;
end;
ak = ifft(ak)/(m2*(im+1));
ak = [conj(ak(m2+1:-1:2)) ak(1:m2+1)];
if nargin==3, ak = ak.*hanning(m+1)'; end;
la = -m2:m2;
