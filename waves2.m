%waves2.m
%平面TEM波传播的仿真，程序参考https://zhidao.baidu.com/question/584142355721878005.html
clear                                  
m=3;   
x=(0:0.01:1)*m;
figure;grid on; hold on;        
axis([0,m,-1,1,-1,1])
data = zeros(size(x));
hy = stem(x,data,'r.');
hz = stem3(x,data,data,'b.');
n = length(x);
i=1;
view(3);
while 1
    if i>n
        data=[data(end),data(1:end-1)];
    else                      
        data=[sin(2*pi*x(i)),data(1:end-1)];
    end                               
    set(hy,'YData',data)                
    set(hz,'ZData',data)                
    drawnow                           
    pause(0.02)
    i=i+1;                            
end