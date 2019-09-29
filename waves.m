
%本程序用来模拟平面电磁波在空间中的传播

%假设电磁波沿着X轴正向传播，电场具有Z方向的分量Ez，磁场具有Y方向上的分量Hy

%由于程序中的电场分量与磁场分量均与两个参数-时间和坐标有关，因此为了使

%两个参数的变化对电磁场分量值的影响产生明显改变，将时间的单位设为纳秒

%反映电磁场性质的其他参数均设为常数，即自由空间中的值

clear

close all

u0=4*pi*1e-7;          %自由空间中的磁导率

e0=1e-9/(36*pi);       %自由空间中的电介质常数

Z0=(u0/e0)^0.5;        %自由空间中的波阻抗

f=1e8;                 %电磁波的频率

w=2*pi*f;             

k=w*(u0*e0)^0.5;       %波数

phi_E=0;               %初始相位设为0

phi_H=0;

EE=20;                  %电场幅度

HH=EE/Z0;

x=0:0.1:20;            %传播方向上的采样点

m0=zeros(size(x));

gifname='mag_motion.gif';

figure

for t=0:1:100           %为了消除波数与频率之间的数量级带来的影响，时间单位为ns

    Ez=EE*cos(k*x-w*t*1e-9+phi_E);  %电场强度值

    Hy=HH*cos(k*x-w*t*1e-9+phi_H);  %磁场强度值

    

    plot3(x,m0,Ez,'b','LineWidth',2);  %绘制电场传播曲线

    hold on

    plot3(x,Hy,m0,'r','LineWidth',2);  %绘制磁场传播曲线

    hold off

    xlabel('传播方向')

    ylabel('磁场Hy')

    zlabel('电场Ez') 

    title(['平面电磁波传播示意图','t=',num2str(t),'ns'],'fontsize',14)

    set(gca,'fontsize',12)

    drawnow

    frame=getframe(1);%获取当前图像

    im=frame2im(frame);

    [imind,cm]=rgb2ind(im,500);%格式转换

    if t==0;

        imwrite(imind,cm,gifname,'gif');%创建一个gif文件

    else

        imwrite(imind,cm,gifname,'gif','WriteMode','append','DelayTime',0.1);

        %向gif文件中添加一张图片

    end

%  end

end