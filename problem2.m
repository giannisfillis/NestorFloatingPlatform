% IOANNIS FILLIS AM: 5380
% KONSTANTINOS ZOIS AM: 5226
h = 0.1;
AM = 5380;
M = 500000;
Iz = 357000000;
x0 = AM/1000;
x0tn = 0;
y0 = 0;
y0tn = 0;
fx = AM;
nz = 0;
Dx = 11835;
Dy = 11835 + AM;

t = 0:h:1000;

#ytn
for i = 0:length(t)-1;
  if (i==0)
    ytn(i+1) = y0tn + h*((nz - Dy*abs(y0tn)*y0tn)/Iz);
  else
    ytn(i+1) = ytn(i) + h*((nz - Dy*abs(ytn(i))*ytn(i))/Iz);
  end
end

#y
for i = 0:length(t)-1;
  if (i==0)
    y(i+1) = y0 + h*y0tn;
  else
    y(i+1) = y(i) + h*ytn(i);
  end
end

#xtn
for i = 0:length(t)-1;
  if (i==0)
    xtn(i+1) = x0tn + h*((fx-Dx*abs(x0tn)*x0tn + M*sin(y0)*y0tn*x0tn)./M*cos(y0));
  else
    xtn(i+1) = xtn(i) + h*((fx-Dx*abs(xtn(i))*xtn(i) + M*sin(y(i))*ytn(i)*xtn(i))/M*cos(y(i)));
  end
end

#x
for i = 0:length(t)-1;
  if (i==0)
    x(i+1) = x0 + h*x0tn;
  else
    x(i+1) = x(i) + h*xtn(i);
  end
end

subplot(4,1,1);
plot(t,x);
title("x");
xlabel("t");
ylabel("x(t)");
subplot(4,1,2);
plot(t,xtn);
title("xtn");
xlabel("t");
ylabel("xtn(t)");
subplot(4,1,3);
plot(t,y);
title("y");
xlabel("t");
ylabel("y(t)");
subplot(4,1,4);
plot(t,ytn);
title("ytn");
xlabel("t");
ylabel("ytn(t)");

