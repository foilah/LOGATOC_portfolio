clc; clear;

h = 0.1;
t = 0:h:10;
n = length(t);

y = zeros(1,n);
v = zeros(1,n);

y(1) = 1;
v(1) = 0;

for i = 1:n-1
    y_predict = y(i) + h*v(i);
    v_predict = v(i) + h*(-y(i));

    y(i+1) = y(i) + h*(v(i) + v_predict)/2;
    v(i+1) = v(i) + h*(-y(i) - y_predict)/2;
end

plot(t,y)
title('Heun Method Solution')
xlabel('t')
ylabel('y(t)')
grid on