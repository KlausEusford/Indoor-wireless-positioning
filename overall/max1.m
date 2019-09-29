function y=max1(x)
y=0;
[m,n]=size(x);
for i=1:m
    for j=1:n
        if x(i,j)>=y
            y=x(i,j);
        end
    end
end