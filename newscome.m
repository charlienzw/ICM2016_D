%% discribe the process of stimulating and get the velocity
% A is the network. p is the initial forwarding probability. 
% t0 is the time of the first step. dt is the time between people.
function v=newscome(A,ty,t0,dt,p0) 
ison=zeros(size(A,1),1);
ison(size(A,1)-3+ty)=1;
isonx=zeros(size(A,1)-3,1);
for i=1:length(A(size(A,1)-3+ty,:))
    if A(size(A,1)-3+ty,i)==1
        ison(i)=1;
    end
end
t=t0;
p=p0;
while sum(ison(1:size(A,1)-3))/(size(A,1)-3)<0.8
    for i=1:size(A,1)-3
        if ison(i)==1
        if rand<p
            for j=1:size(A,1)-3
                if A(i,j)==1&&ison(j)~=1
                isonx(j)=1;
                end
            end
        end
        end
    end
    for k=1:size(A,1)-3
        if isonx(k)==1
            ison(k)=1;
        end
    end
    isonx=zeros(size(A,1)-3,1);
     t=t+t0+dt
    sum(ison(1:length(ison)-3))
end
v=1/t;

            