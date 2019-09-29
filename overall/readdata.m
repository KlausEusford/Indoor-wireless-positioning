%readdata.m
%������ȡ�ɼ���RSSI���ݲ����������Լ�ģ�����ֱ��
final=[];
for i=1:7 %7������
    for j=1:4  %ÿ������4����
        for k=1:5   %ÿ����5�β���
            filename = [num2str(i) num2str(j) num2str(k) '.dat'];            
            csi_trace = read_bf_file(filename);
            sizes=length(csi_trace);
            for l=1:sizes%ÿ�������㶼��ɵ�һ��RSSI����
                csi_entry=csi_trace{l};%ÿ�����ݰ���3�����ߵ�RSSI����
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