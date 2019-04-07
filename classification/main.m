%clc;
m=csvread('propublicaTrain.csv',1,0);
n=csvread('propublicaTest.csv',1,0);

y1=MLE(m,n)';
y2=KNN(m,n,109,2)';
y3=Bayes(m,n)';
y_true=n(:,1);

sum(y_true==y1)/size(n,1)
sum(y2==y_true)/size(n,1)
sum(y3==y_true)/size(n,1)

