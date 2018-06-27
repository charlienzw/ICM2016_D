function f=rans(m,n,p)
A=rand(m,n);
for i=1:m
    for j=1:n
        if A(i,j)<=p
            A(i,j)=1;
        else
            A(i,j)=0;
        end
    end
end
f=A;