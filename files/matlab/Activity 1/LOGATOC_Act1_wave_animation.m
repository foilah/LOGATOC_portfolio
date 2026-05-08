clc; clear;

[x,t] = meshgrid(0:0.2:10, 0:0.2:10);

for k = 1:50
    z = sin(x - t + k*0.1);

    surf(x,t,z)
    xlabel('X')
    ylabel('Time')
    zlabel('Amplitude')
    title('3D Wave Propagation')
    axis([0 10 0 10 -1 1])
    pause(0.1)
end