%same_distance_RSSI.m
%计算不同距离上的RSSI强度分布
x=final(:,1);
y=final(:,2);
legendname =[];
figure(1)
hold on
xmax=max(y);
xmin=min(y);
axis([xmin xmax 0 0.7]);
data=[];
color=['c', 'm', 'y', 'r', 'g', 'b', 'k' 'w'];
shape=['o' 'x' '+' '*' 's' 'd' 'v' '^' '<' '>' 'p' 'h'];
for j=1:0.5:4;
res=[];   
for i=1:length(x)
    if(x(i)==j)
      res=[res y(i)];
    end
end %提取出距离jm的值
data=[data;mean(res)];
[m,n]=hist(res);
resl=[m'/sum(m) n'];
resl(find(resl(:,1)==0),:)=[];
rs_max=max(res);
rs_min=min(res);
%ymax=max(resl(:,1));
%ymin=min(resl(:,1));
X1=rs_min:0.001:rs_max;
Y1=interp1(resl(:,2),resl(:,1),X1,'cubic');
plot(resl(:,2),resl(:,1),shape((j-0.5)*2),'MarkerSize', 5)
plot(X1,Y1,color((j-0.5)*2))
legendname = [legendname;'距离为' num2str(j,'%.1f') 'm处的RSSI'];
end
legend(legendname(1,:),'',legendname(2,:),'',legendname(3,:),'',legendname(4,:),'',legendname(5,:),'',legendname(6,:),'',legendname(7,:),'')
xlabel('RSSI强度/dB')
ylabel('概率密度')
title('不同距离上RSSI的强度分布')
