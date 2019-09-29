function [P] = Triangle(A,B,C,dA,dB,dC)
    
    %A,B,CΪ����ѡ�����ű�ڵ�,�ڵ�������֪
    if (dA>C(1))
        dA=C(1);
    end
    if (dC>C(1))
        dC=C(1);
    end    
    if (dA>B(2))
        dA=B(2);
    end
    if (dB>B(2))
        dB=B(2);
    end
    
    disa=dA;
    disb=dB;
    disc=dC;
    %����δ֪����x,yΪ���ű���
    syms x y;
    
    %���뷽��,���ű�ڵ�ΪԲ��,�ű�ڵ㵽δ֪�ڵ�Ĳ�������Ϊ�뾶������Բ
    f1 = (A(1)-x)^2+(A(2)-y)^2-dA^2;
    f2 = (B(1)-x)^2+(B(2)-y)^2-dB^2;
    f3 = (C(1)-x)^2+(C(2)-y)^2-dC^2;
    
    %��������������,������Բ����
    real_flag=0;
    while(1)
        s1 = solve(f1,f2); %��A,B��Բ�Ľ���
        x1 = double(s1.x);
        y1 = double(s1.y);
        real_flag=isreal(x1) & isreal(y1);
        if(real_flag)
            break;
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
        s2 = solve(f2,f3); %��B,C��Բ�Ľ���
        x2 = double(s2.x);
        y2 = double(s2.y);
        real_flag=isreal(x2) & isreal(y2);
        if(real_flag)
            break;
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
        s3 = solve(f1,f3); %��A,C��Բ�Ľ���
        x3 = double(s3.x);  %�����(���ű���)ת��Ϊ˫������ֵ
        y3 = double(s3.y);
        real_flag=isreal(x3) & isreal(y3);
        if(real_flag)
            break;
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
    %ѡ���ڲ����������
    %��Բ�ཻ������,�������Բ�Ľ���Ϊѡ������Pab,Pbc,Pac
    d1(1) = sqrt(((C(1)-x1(1))^2+(C(2)-y1(1))^2));
    d1(2) = sqrt(((C(1)-x1(2))^2+(C(2)-y1(2))^2));
    if d1(1) <= d1(2)
        Pab(1) = x1(1);
        Pab(2) = y1(1);
    else
        Pab(1) = x1(2);
        Pab(2) = y1(2);
    end
    d2(1) = sqrt(((A(1)-x2(1))^2+(A(2)-y2(1))^2));
    d2(2) = sqrt(((A(1)-x2(2))^2+(A(2)-y2(2))^2));
    if d2(1) <= d2(2)
        Pbc(1) = x2(1);
        Pbc(2) = y2(1);
    else
        Pbc(1) = x2(2);
        Pbc(2) = y2(2);
    end
    d3(1) = sqrt(((B(1)-x3(1))^2+(B(2)-y3(1))^2));
    d3(2) = sqrt(((B(1)-x3(2))^2+(B(2)-y3(2))^2));
    if d3(1) <= d3(2)
        Pac(1) = x3(1);
        Pac(2) = y3(1);
    else
        Pac(1) = x3(2);
        Pac(2) = y3(2);
    end
    
    %Pab
    %Pbc
    %Pac
    
    %������Բ�ڲ���������Pab,Pbc,Pac������,��Ϊδ֪�ڵ�P,��ɶ�λ
    P(1) = (Pab(1)+Pbc(1)+Pac(1))/3;
    P(2) = (Pab(2)+Pbc(2)+Pac(2))/3;