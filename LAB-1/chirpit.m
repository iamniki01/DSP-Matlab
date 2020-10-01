function x = chirpit
%        x = chirpit;
% Generation of 3 periods of a periodic chirp sampled
% at 40 kHz. The chirp period is 4 second. Within
% a period the chirp frequency linearily increases from
% 0 to 8 kHz.
%

% generation of one chirp period
x = chirp([0:1/40000:4-1/40000],0,4,8000);


% 3 periods
x = [ x , x , x ];
