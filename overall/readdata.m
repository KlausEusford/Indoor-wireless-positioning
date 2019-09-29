%readdata.m
%批量读取采集的RSSI数据并根据数据以及模型拟合直线
final=[];
for i=1:7 %7个距离
    for j=1:4  %每个距离4个点
        for k=1:5   %每个点5次测量
            filename = [num2str(i) num2str(j) num2str(k) '.dat'];            
            csi_trace = read_bf_file(filename);
            sizes=length(csi_trace);
            for l=1:sizes%每个采样点都会采到一组RSSI数据
                csi_entry=csi_trace{l};%每组数据包含3根天线的RSSI数据
                A=[(i+1)*0.5 csi_entry.rssi_a];
                final=vertcat(final,A);
                B=[(i+1)*0.5 csi_entry.rssi_b];
                final=vertcat(final,B);
                C=[(i+1)*0.5 csi_entry.rssi_c];
                final=vertcat(final,C);
            end
        end            
    end
end
X=final(:,1);
for i=1:length(X)
    X(i,1)=log10(X(i,1));
end
Y=final(:,2);
X=[ones(length(Y),1),X];
b=regress(Y,X);