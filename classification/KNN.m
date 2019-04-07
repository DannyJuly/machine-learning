function y = KNN(train, test, k, p)
m1=size(train,1);
n1=size(test,1);
%%%%%%standardize
m=zeros(m1,size(train,2)-1);
n=zeros(n1,size(test,2)-1);
mean_train=mean(train);
mean_test=mean(test);
std_train=std(train);
std_test=std(test);
for i = 2:size(train,2)
       m(:,i-1) = (train(:,i)-mean_train(1,i))./std_train(1,i);
end
for i =2 : size(test,2)
       n(:,i-1) = (test(:,i)-mean_test(1,i))./std_test(1,i);
end

dis=zeros(m1,n1);

for h = 1:size(m,2) 
    a=m;
    b=n;
    a(:,h)=[];
    b(:,h)=[];
    for i = 1:n1
        for j = 1:m1
            dis(j,i)=sum((b(i,:)-a(j,:)).^p)^(1/p);
            %dis(j,i)=dot(n(i,2:end),m(j,2:end))/(normest(n(i,2:end))*normest(m(i,2:end)));
        end
    end
    [array, index]=sort(dis);
    for i = 1:n1
            k_sum=sum(train(index(1:k,i).',1));
            if k_sum>k/2
                y(i)=1;
            else
                y(i)=0;
            end
    end
    w(h)=sum(y==1)/size(test,1);
end
w=w/sum(w)
 for i = 1:n1
        for j = 1:m1
            dis(j,i)=sum((n(i,:)-m(j,:)).^p*w')^(1/p);
            %dis(j,i)=dot(n(i,2:end),m(j,2:end))/(normest(n(i,2:end))*normest(m(i,2:end)));
        end
end
[array, index]=sort(dis);
for i = 1:n1
        k_sum=sum(train(index(1:k,i).',1));
        if k_sum>k/2
            y(i)=1;
        else
            y(i)=0;
        end
end




end


    