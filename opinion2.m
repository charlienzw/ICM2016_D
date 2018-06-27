%% discribe the process of stimulating and get the velocity
% A is the network. p is the initial forwarding probability. 
% t0 is the time of the first step. dt is the time between people.
function [x,y]=opinion2(A,p,ty) 
believe=ran(size(A,1)-3,p);
ison=zeros(size(A,1),1);
ison(size(A,1)-3+ty)=1;
isonx=zeros(size(A,1)-3,1);
times=zeros(size(A,1)-3,1);
for i=1:length(A(size(A,1)-3+ty,:))
    if A(size(A,1)-3+ty,i)==1
        ison(i)=1;
        times(i)=times(i)+1;
    end
end
for cc=1:100
    cc
    for i=1:size(A,1)-3
        onceon=zeros(size(A,1)-3,1);
        if ison(i)==1
        if rand<0.3
            for j=1:size(A,1)-3
                if A(i,j)==1
                    isonx(j)=1;
                    onceon(j)=1;
                    times(j)=times(j)+1;
                end
            end
        end
        end
        cnt=1;
        for k=1:size(A,1)-3
            if onceon(k)==1
              believex(cnt)=believe(k);
              cnt=cnt+1;
            end
        end
        if cnt~=1
            if believe(i)==0
                if rand<(sum(believex)/length(believex)*(times(i)+1))
                    believe(i)=1;
                end
            end
            if sum(believex)<length(believex)/2
                if believe(i)==1
                    if rand<(length(believex)-sum(believex))/length(believex)
                        believe(i)=0;
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
    bel(cc)=sum(believe)/length(believe);
end
x=[1:100];
y=bel;


            