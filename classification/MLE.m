function  y = MLE(train,test)
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

mu1=mean(train1( : , 2:end));
mu0=mean(train0( : , 2:end));
%var1=var(train1(:,2:end));
%var0=var(train1(:,2:end));
sigma1=cov(train1(:,2:end))+.0001*eye(9);
sigma0=cov(train0(:,2:end))+.0001*eye(9);
for i = 1:size(test,1)
    p1=mvnpdf(test(i,2:end),mu1,sigma1);
    p2=mvnpdf(test(i,2:end),mu0,sigma0);
    if p1>=p2
        y(i)=1;
    else
        y(i)=0;
    end
end