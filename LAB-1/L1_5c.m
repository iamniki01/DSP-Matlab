b=firpm(256,[0,3.5/20,4/20,20/20], [1,1,0,0]);
n = 256;
y=filter(b,1,x40);
x8LP=y(1:5:length(y));
sound(x8LP, 8000);