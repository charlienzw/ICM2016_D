function [f,o]=zhishu2(x)
n=length(x);
alpha=0.9;st1(1)=x(1);st2(1)=x(1);
for i=2:n
    st1(i)=alpha*x(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
a=2*st1-st2;
b=alpha/(1-alpha)*(st1-st2);
yhat=a+b;
f=yhat(n);