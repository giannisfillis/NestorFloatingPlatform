% IOANNIS FILLIS AM: 5380
% KONSTANTINOS ZOIS AM: 5226
Iz = 357000000;
Dy = 11835;
Kpy = 50000;
Kdy = 7000000;
AM = 5380;
ydes = AM/10000;
t = 0:1000;
D = (Kdy + Dy)^2 - 4*Iz*Kpy;
c1 = ((-(Kdy + Dy) - sqrt(D))*ydes)/(2*sqrt(D));
c2 = (((Kdy + Dy) - sqrt(D))*ydes)/(2*sqrt(D));
y1 = (-(Kdy + Dy) + sqrt(D))/(2*Iz);
y2 = (-(Kdy + Dy) - sqrt(D))/(2*Iz);
y = c1*exp(y1*t) + c2*exp(y2*t) + ydes;
plot(t,y,"r");
title("Diagram y(t)");
xlabel("t(seconds)");
ylabel("ψ");
grid;


