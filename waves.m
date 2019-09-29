
%����������ģ��ƽ���Ų��ڿռ��еĴ���

%�����Ų�����X�����򴫲����糡����Z����ķ���Ez���ų�����Y�����ϵķ���Hy

%���ڳ����еĵ糡������ų�����������������-ʱ��������йأ����Ϊ��ʹ

%���������ı仯�Ե�ų�����ֵ��Ӱ��������Ըı䣬��ʱ��ĵ�λ��Ϊ����

%��ӳ��ų����ʵ�������������Ϊ�����������ɿռ��е�ֵ

clear

close all

u0=4*pi*1e-7;          %���ɿռ��еĴŵ���

e0=1e-9/(36*pi);       %���ɿռ��еĵ���ʳ���

Z0=(u0/e0)^0.5;        %���ɿռ��еĲ��迹

f=1e8;                 %��Ų���Ƶ��

w=2*pi*f;             

k=w*(u0*e0)^0.5;       %����

phi_E=0;               %��ʼ��λ��Ϊ0

phi_H=0;

EE=20;                  %�糡����

HH=EE/Z0;

x=0:0.1:20;            %���������ϵĲ�����

m0=zeros(size(x));

gifname='mag_motion.gif';

figure

for t=0:1:100           %Ϊ������������Ƶ��֮���������������Ӱ�죬ʱ�䵥λΪns

    Ez=EE*cos(k*x-w*t*1e-9+phi_E);  %�糡ǿ��ֵ

    Hy=HH*cos(k*x-w*t*1e-9+phi_H);  %�ų�ǿ��ֵ

    

    plot3(x,m0,Ez,'b','LineWidth',2);  %���Ƶ糡��������

    hold on

    plot3(x,Hy,m0,'r','LineWidth',2);  %���ƴų���������

    hold off

    xlabel('��������')

    ylabel('�ų�Hy')

    zlabel('�糡Ez') 

    title(['ƽ���Ų�����ʾ��ͼ','t=',num2str(t),'ns'],'fontsize',14)

    set(gca,'fontsize',12)

    drawnow

    frame=getframe(1);%��ȡ��ǰͼ��

    im=frame2im(frame);

    [imind,cm]=rgb2ind(im,500);%��ʽת��

    if t==0;

        imwrite(imind,cm,gifname,'gif');%����һ��gif�ļ�

    else

        imwrite(imind,cm,gifname,'gif','WriteMode','append','DelayTime',0.1);

        %��gif�ļ������һ��ͼƬ

    end

%  end

end