function y = Bayes(train, test)
train1=[];
train0=[];
num=size(train,1);
for i = 1:num
    if train(i,1)==1
        train1=[train1;train(i,:)];
    else
        train0=[train0;train(i,:)];
    end
end
p_y1=size(train1,1)/num;
p_y0=1-p_y1;
mu1=mean(train1( : , 2:end));
mu0=mean(train0( : , 2:end));
std1=std(train1(:,2:end));
std0=std(train1(:,2:end));
y=zeros(1,2000);
for i = 1 : size(test,1)
    p1 = prod(normpdf(test(i,2:end),mu1,std1))*p_y1;
    p0 = prod(normpdf(test(i,2:end),mu0,std0))*p_y0;
    if p1>p0
        y(i)=1;
    else
        y(i)=0;
    end
end
end  