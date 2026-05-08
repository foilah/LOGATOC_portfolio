clc; clear;

h = 0.1;
t = 0:h:10;
n = length(t);

y = zeros(1,n);
v = zeros(1,n);

y(1) = 1;
v(1) = 0;

for i = 1:n-1
    v(i+1) = (v(i) - h*y(i)) / (1 + h^2);
    y(i+1) = y(i) + h*v(i+1);
end

plot(t,y)
title('Implicit Euler Method Solution')
xlabel('t')
ylabel('y(t)')
grid on