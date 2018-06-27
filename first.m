clear all
clc
close all
%% parameters
pnewspaper=0.29;
pradio=0.29;
pTV=0.55;
pcomputer=0.79;
psmartphone=0.45;
pconnect=0.0003;
peconnect=0.0003;
t0newspaper=3;
t0radio=2;
t0TV=1;
tconnect=1;
node=10000;
r1_2=3000;
r2_3=6000;
%% today's network
A=zeros(node+3,node+3);
A(node+1:node+3,node+1:node+3)=0; % the last three nodes are newspapaer, radio, and TV
A(1:r1_2,1:r1_2)=rans(r1_2,r1_2,pconnect);
A(r1_2+1:r2_3,r1_2+1:r2_3)=rans(r1_2,r1_2,pconnect);
A(r2_3+1:node,r2_3+1:node)=rans(size(A(r2_3+1:node,r2_3+1:node),1),size(A(r2_3+1:node,r2_3+1:node),2),pconnect);% region1 is 1-r1_2. region2 is r1_2+1-r2_3. region3 is r2_3+1-node.
region1_internet=ran(r1_2,pcomputer)|ran(r1_2,psmartphone);
region2_internet=ran(r2_3-r1_2,pcomputer)|ran(r2_3-r1_2,psmartphone);
region3_internet=ran(node-r2_3,pcomputer)|ran(node-r2_3,psmartphone);
region_internet=[region1_internet region2_internet region3_internet];
for i=1:r1_2
    for j=r1_2+1:node
        if region_internet(i)&&region_internet(j);
            if rand<peconnect
                A(i,j)=1;
            end
        end
    end
end
for i=r1_2+1:node
    for j=1:r1_2
        if region_internet(i)&&region_internet(j);
            if rand<peconnect
                A(i,j)=1;
            end
        end
    end
end
for i=r1_2+1:r2_3
    for j=r2_3+1:node
        if region_internet(i)&&region_internet(j);
            if rand<peconnect
                A(i,j)=1;
            end
        end
    end
end
for i=r2_3+1:node
    for j=r1_2+1:r2_3
        if region_internet(i)&&region_internet(j);
            if rand<peconnect
                A(i,j)=1;
            end
        end 
    end
end
A(node+1,1:node)=ran(node,pnewspaper);
A(node+2,1:node)=ran(node,pradio);
A(node+3,1:node)=ran(node,pTV);
for i=1:node+3
    for j=1:node+3
        if i==j
        A(i,j)=0;
        end
    end
end
%% test
p0=0.3;
vnewspaper=newscome(A,1,t0newspaper,tconnect,p0);
vradio=newscome(A,2,t0radio,tconnect,p0);
vTV=newscome(A,3,t0TV,tconnect,p0);
p0=0.1:0.1:0.9;
for i=1:9
    vTV(i)=newscome(A,3,t0TV,tconnect,p0(i));
    i
end
plot(p0,vTV)

p0q=0.1:0.001:0.9;
plot(p0q,interp1(p0,vTV,p0q,'spline'))
for p=0.1:0.2:0.9
    [x,y]=opinion2(A,p,1);
    plot(x,y);
    hold on
end
