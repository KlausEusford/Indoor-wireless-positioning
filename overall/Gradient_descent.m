function W = Gradient_descent(X,Y)  
tX = X;%tX������ֻ��Ϊ�˴���detaWʱʹ��  
W = 0.1*ones(size(X,2)+1,1);  
X = [ones(size(X,1),1),X];  
k = 0;%��������  
while true  
    detaW = zeros(size(tX,2)+1,1);  
    O = X*W;  
    detaW = detaW + 0.00005*X'*(Y - O);%0.00005��ѧϰ����  
    W = W + detaW;  
    k = k+1;  
    if 1/2*( norm(Y - X*W) )^2 < 5 || k>10000 %������С��5���ߵ�����������10000��ֹͣ  
        break;  
    end  
    fprintf('iterator times %d, error %f\n',k,1/2*( norm(Y - X*W) )^2);  
end  