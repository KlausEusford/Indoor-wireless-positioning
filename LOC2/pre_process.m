%pre_process.m
%通过X1X2X3\Y1Y2Y3\Z1Z2Z3 RSSI数据估算待测点到房间ABC三个已知锚点的距离，并通过Triangle()函数估算其位置
final=[];
for i=1:3%3个测量点
	filename = ['x' num2str(i) '.dat'];            
	csi_trace = read_bf_file(filename);
    sizes=size(csi_trace);
    sizes=sizes(1,1);
    for l=1:sizes
        csi_entry=csi_trace{l};
        final=[final csi_entry.rssi_a csi_entry.rssi_b csi_entry.rssi_c];
    end            
end
rssi_x=sum(final)/length(final); %计算出相对于点A的RSSI强度值
final=[];
for i=1:3
	filename = ['y' num2str(i) '.dat'];            
	csi_trace = read_bf_file(filename);
    sizes=size(csi_trace);
    sizes=sizes(1,1);
    for l=1:sizes
        csi_entry=csi_trace{l};
        final=[final csi_entry.rssi_a csi_entry.rssi_b csi_entry.rssi_c];
    end            
end
rssi_y=sum(final)/length(final);
final=[];
for i=1:3
	filename = ['z' num2str(i) '.dat'];            
	csi_trace = read_bf_file(filename);
    sizes=size(csi_trace);
    sizes=sizes(1,1);
    for l=1:sizes
        csi_entry=csi_trace{l};
        final=[final csi_entry.rssi_a csi_entry.rssi_b csi_entry.rssi_c];
    end            
end
rssi_z=sum(final)/length(final);
dis_x = 10^((47.2605 - rssi_x)/14.4903); %到三个已知锚点的距离
dis_y = 10^((47.2605 - rssi_y)/14.4903);
dis_z = 10^((47.2605 - rssi_z)/14.4903);
A=[0,0];
B=[0,5.55];
C=[6.76,0];
Triangle(A,B,C,dis_x,dis_y,dis_z)