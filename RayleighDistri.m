%RayleighDistri.m
%�����ֲ��ĸ����ܶȺ���
clear,clc
A=1;
sigma=1;
fx=@(sigma,x,A)x./(sigma^2).*exp(-(A.^2+x.^2)./(2*sigma))*besseli(A.^2,2.027);
x=0:.01:4;
y=fx(sigma,x,A);
figure(1)
plot(x,y,'r-')
xlabel('r/��')
ylabel('p(r)')
title('�����ֲ��ĸ����ܶȺ���')
grid on