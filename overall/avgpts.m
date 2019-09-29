%avgpts.m
%计算各个位置的RSSI均值，画出RSSI空间分布图

final=[];
avg=[];
xval=[0.9882,0.8387,0.5446,0.1564];
yval = xval(end:-1:1);
for i=1:7 %7个距离
    for j=1:4  %每个距离4个点
        sum2=0;
        for k=1:5   %每个点5次测量
            filename = [num2str(i) num2str(j) num2str(k) '.dat'];            
            csi_trace = read_bf_file(filename);
            sizes=size(csi_trace);
            sizes=sizes(1,1);
            sum1=0;
            for l=1:sizes  
                csi_entry=csi_trace{l};
                A=[(i+1)*0.5 csi_entry.rssi_a];
                final=vertcat(final,A);
                B=[(i+1)*0.5 csi_entry.rssi_b];
                final=vertcat(final,B);
                C=[(i+1)*0.5 csi_entry.rssi_c];
                final=vertcat(final,C);
                sum1=sum1+csi_entry.rssi_a+csi_entry.rssi_b+csi_entry.rssi_c;
            end
        sum2=sum2+sum1;
        end
    avg=[avg;((i+1)*0.5)*xval(j),((i+1)*0.5)*yval(j),sum2/(15*sizes)];    
    end
end
X=final(:,1);
for i=1:length(X)
    X(i,1)=log10(X(i,1));
end
Y=final(:,2);
X=[ones(length(Y),1),X];
b=regress(Y,X);

A=avg;
x=A(:,1);y=A(:,2);z=A(:,3);
scatter(x,y,5,z)%散点图
figure
[X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
pcolor(X,Y,Z);shading interp%伪彩色图
figure,contourf(X,Y,Z) %等高线图
figure,mesh(X,Y,Z)%三维曲面
figure(1)
xlabel('X方向距离/m')
ylabel('Y方向距离/m')
title('采样点位置分布图')
figure(2)
xlabel('X方向距离/m')
ylabel('Y方向距离/m')
title('插值后的RSSI强度伪彩色图')
figure(3)
xlabel('X方向距离/m')
ylabel('Y方向距离/m')
title('插值后的RSSI强度等高线图')
figure(4)
xlabel('X方向距离/m')
ylabel('Y方向距离/m')
zlabel('RSSI/dB')
title('插值后的RSSI强度立体图')