%draw.m
%根据拟合的RSSI方程计算空间中的RSSI强度理论值
x=0.1:0.05:4;
y=0.1:0.05:4;
[xx,yy]=meshgrid(x,y);
zz =47.2605-14.4903*log10(sqrt(xx^2+yy^2));
surf(xx,yy,zz);
shading interp
xlabel('X方向距离(m)')
ylabel('Y方向距离(m)')
zlabel('RSSI理论值(dB)')