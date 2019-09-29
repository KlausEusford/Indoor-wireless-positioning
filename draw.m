%draw.m
%������ϵ�RSSI���̼���ռ��е�RSSIǿ������ֵ
x=0.1:0.05:4;
y=0.1:0.05:4;
[xx,yy]=meshgrid(x,y);
zz =47.2605-14.4903*log10(sqrt(xx^2+yy^2));
surf(xx,yy,zz);
shading interp
xlabel('X�������(m)')
ylabel('Y�������(m)')
zlabel('RSSI����ֵ(dB)')