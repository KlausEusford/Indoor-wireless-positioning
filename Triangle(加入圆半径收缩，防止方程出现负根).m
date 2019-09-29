function [P] = Triangle(A,B,C,dA,dB,dC)
    
    %A,B,C为三个选定的信标节点,节点坐标已知(为便于防真及验证,代码中采用的等边三角形)
    %A = [0,0];
    %B = [25,25*sqrt(3)];
    %C = [50,0];
    disa=dA;
    disb=dB;
    disc=dC;
    %定义未知坐标x,y为符号变量
    syms x y;
    
    %距离方程,以信标节点为圆心,信标节点到未知节点的测量距离为半径作三个圆
    f1 = (A(1)-x)^2+(A(2)-y)^2-dA^2;
    f2 = (B(1)-x)^2+(B(2)-y)^2-dB^2;
    f3 = (C(1)-x)^2+(C(2)-y)^2-dC^2;
    
    %任两个方程联立,求任两圆交点
    real_flag=0;
    while(1)
        s1 = solve(f1,f2); %求A,B两圆的交点
        x1 = double(s1.x);
        y1 = double(s1.y);
        real_flag=isreal(x1) & isreal(y1);
        if(real_flag)
            if((x1(1)>=0&&y1(1)>=0)||(x1(2)>=0&&y1(2)>=0))
                break;
            else
                disa=disa-0.05;
                disb=disb-0.05;
                f1 = (A(1)-x)^2+(A(2)-y)^2-disa^2;
                f2 = (B(1)-x)^2+(B(2)-y)^2-disb^2; 
            end
        else
            disa=disa+0.05;
            disb=disb+0.05;
            f1 = (A(1)-x)^2+(A(2)-y)^2-disa^2;
            f2 = (B(1)-x)^2+(B(2)-y)^2-disb^2;
        end
    end
    
    disa=dA;
    disb=dB;
    f1 = (A(1)-x)^2+(A(2)-y)^2-dA^2;
    f2 = (B(1)-x)^2+(B(2)-y)^2-dB^2;
    f3 = (C(1)-x)^2+(C(2)-y)^2-dC^2;
    while(1)
        s2 = solve(f2,f3); %求B,C两圆的交点
        x2 = double(s2.x);
        y2 = double(s2.y);
        real_flag=isreal(x2) & isreal(y2);
        if(real_flag)
            if((x2(1)>=0&&y2(1)>=0)||(x2(2)>=0&&y2(2)>=0))
                break;
            else
                 disb=disb-0.05;
                 disc=disc-0.05;
                 f2 = (B(1)-x)^2+(B(2)-y)^2-disb^2;
                 f3 = (C(1)-x)^2+(C(2)-y)^2-disc^2;
            end
        else
            disb=disb+0.05;
            disc=disc+0.05;
            f2 = (B(1)-x)^2+(B(2)-y)^2-disb^2;
            f3 = (C(1)-x)^2+(C(2)-y)^2-disc^2;
        end
    end    
    
    disb=dB;
    disc=dC;
    f1 = (A(1)-x)^2+(A(2)-y)^2-dA^2;
    f2 = (B(1)-x)^2+(B(2)-y)^2-dB^2;
    f3 = (C(1)-x)^2+(C(2)-y)^2-dC^2;
    while(1)
        s3 = solve(f1,f3); %求A,C两圆的交点
        x3 = double(s3.x);  %将结果(符号变量)转换为双精度数值
        y3 = double(s3.y);
        real_flag=isreal(x3) & isreal(y3);
        if(real_flag)
            if((x3(1)>=0&&y3(1)>=0)||(x3(2)>=0&&y3(2)>=0))
                break;
            else
                 disa=disa-0.05;
                 disc=disc-0.05;
                 f1 = (A(1)-x)^2+(A(2)-y)^2-disa^2;
                 f3 = (C(1)-x)^2+(C(2)-y)^2-disc^2;
            end
        else
            disa=disa+0.05;
            disc=disc+0.05;
            f1 = (A(1)-x)^2+(A(2)-y)^2-disa^2;
            f3 = (C(1)-x)^2+(C(2)-y)^2-disc^2;
        end
    end    
    f1 = (A(1)-x)^2+(A(2)-y)^2-dA^2;
    f2 = (B(1)-x)^2+(B(2)-y)^2-dB^2;
    f3 = (C(1)-x)^2+(C(2)-y)^2-dC^2;        
    %选择内侧的三个交点
    %两圆相交于两点,距第三个圆心近的为选定交点Pab,Pbc,Pac
    d1(1) = sqrt(((C(1)-x1(1))^2+(C(2)-y1(1))^2));
    d1(2) = sqrt(((C(1)-x1(2))^2+(C(2)-y1(2))^2));
    if ((d1(1) <= d1(2)) && (x1(1)>=0&&y1(1)>=0))
        Pab(1) = x1(1);
        Pab(2) = y1(1);
    else
        Pab(1) = x1(2);
        Pab(2) = y1(2);
    end
    d2(1) = sqrt(((A(1)-x2(1))^2+(A(2)-y2(1))^2));
    d2(2) = sqrt(((A(1)-x2(2))^2+(A(2)-y2(2))^2));
    if(( d2(1) <= d2(2) ) && (x2(1)>=0&&y2(1)>=0))
        Pbc(1) = x2(1);
        Pbc(2) = y2(1);
    else
        Pbc(1) = x2(2);
        Pbc(2) = y2(2);
    end
    d3(1) = sqrt(((B(1)-x3(1))^2+(B(2)-y3(1))^2));
    d3(2) = sqrt(((B(1)-x3(2))^2+(B(2)-y3(2))^2));
    if ((d3(1) <= d3(2)) && (x3(1)>=0&&y3(1)>=0))
        Pac(1) = x3(1);
        Pac(2) = y3(1);
    else
        Pac(1) = x3(2);
        Pac(2) = y3(2);
    end
    
    %Pab
    %Pbc
    %Pac
    
    %求三个圆内侧三个交点Pab,Pbc,Pac的质心,即为未知节点P,完成定位
    P(1) = (Pab(1)+Pbc(1)+Pac(1))/3;
    P(2) = (Pab(2)+Pbc(2)+Pac(2))/3;