%avgpts.m
%�������λ�õ�RSSI��ֵ������RSSI�ռ�ֲ�ͼ

final=[];
avg=[];
xval=[0.9882,0.8387,0.5446,0.1564];
yval = xval(end:-1:1);
for i=1:7 %7������
    for j=1:4  %ÿ������4����
        sum2=0;
        for k=1:5   %ÿ����5�β���
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
scatter(x,y,5,z)%ɢ��ͼ
figure
[X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%��ֵ
pcolor(X,Y,Z);shading interp%α��ɫͼ
figure,contourf(X,Y,Z) %�ȸ���ͼ
figure,mesh(X,Y,Z)%��ά����
figure(1)
xlabel('X�������/m')
ylabel('Y�������/m')
title('������λ�÷ֲ�ͼ')
figure(2)
xlabel('X�������/m')
ylabel('Y�������/m')
title('��ֵ���RSSIǿ��α��ɫͼ')
figure(3)
xlabel('X�������/m')
ylabel('Y�������/m')
title('��ֵ���RSSIǿ�ȵȸ���ͼ')
figure(4)
xlabel('X�������/m')
ylabel('Y�������/m')
zlabel('RSSI/dB')
title('��ֵ���RSSIǿ������ͼ')