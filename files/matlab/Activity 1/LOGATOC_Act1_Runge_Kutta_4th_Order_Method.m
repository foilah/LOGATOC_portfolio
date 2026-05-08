clc; clear;

h = 0.1;
t = 0:h:10;
n = length(t);

y = zeros(1,n);
v = zeros(1,n);

y(1) = 1;
v(1) = 0;

for i = 1:n-1
    k1y = h*v(i);
    k1v = h*(-y(i));

    k2y = h*(v(i) + k1v/2);
    k2v = h*(-(y(i) + k1y/2));

    k3y = h*(v(i) + k2v/2);
    k3v = h*(-(y(i) + k2y/2));

    k4y = h*(v(i) + k3v);
    k4v = h*(-(y(i) + k3y));

    y(i+1) = y(i) + (k1y + 2*k2y + 2*k3y + k4y)/6;
    v(i+1) = v(i) + (k1v + 2*k2v + 2*k3v + k4v)/6;
end

plot(t,y)
title('RK4 Solution of Second-Order Differential Equation')
xlabel('t')
ylabel('y(t)')
grid on