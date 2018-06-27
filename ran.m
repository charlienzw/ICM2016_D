function f=ran(l,p) %get a 0-1 row by the p(1)=p
f=zeros(1,l);
X=rand(1,l);
[B,I]=sort(X);
for i=1:p*l
    f(I(i))=1;
end