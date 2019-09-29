%boxdata.m
%绘制每个距离上RSSI采样值的箱线图
%load('distance-RSSI(2D).mat')
x=final(:,1);
y=final(:,2);
res=[];   
group=[];
for j=1:0.5:4;
for i=1:length(x)
    if(x(i)==j)
      res=[res y(i)];
      group=[group (j-0.5)*2];
    end
end 
end
boxplot(res,group,'labels',{'1m','1.5m','2m','2.5m','3m','3.5m','4m'})
title('距离与RSSI采样值的箱线图')

figure(2)
avg=grpstats(res, group);
x=[1:0.5:4];
plot(log10(x),avg,'*');
hold on
p=polyfit(log10(x'),avg,1);
yy=polyval(p,log10(x));
plot(log10(x),yy,'r')
xlabel('log10(Distance/m)')
ylabel('RSSI/dB')
title('距离与RSSI均值')