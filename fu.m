clear all
clc
close all
% B=[84587000,102000000,124000000,142823000,172834267,183195742,194158959,205766898,210720370,221724027,230630000]
% A=[282160000,284970000,287630000,290110000,292810000,295520000,298380000,301230000,304090000,306670000,309350000,311720000,314110000,316500000,318860000];
% C=[0.439 0.501 0.601 0.631 0.663 0.696 0.706 0.736 0.758];
% X=C';
%% radio
n=19;
t=[1991 1993 1996:2:2050];
X=xlsread('D:\数模美赛\rtn.xlsx',1,'B2:B12');
for i=1:n
    X=[X;zhishu2(X)];
end
for j=1:length(X)
    if X(j)<0
        X(j)=0;
    end
    if X(j)>100
        X(j)=100;
    end
end
plot(t,X,'linewidth',2);
Xradio=X;
axis([1991 2050 0 100])
hold on
%% TV
n=19;
t=[1991 1993 1996:2:2050];
X=xlsread('D:\数模美赛\rtn.xlsx',1,'C2:C12');
for i=1:n
    X=[X;zhishu2(X)];
end
for j=1:length(X)
    if X(j)<0
        X(j)=0;
    end
    if X(j)>100
        X(j)=100;
    end
end
plot(t,X,'linewidth',2);
XTV=X;
%% newspaper
n=19;
t=[1991 1993 1996:2:2050];
X=xlsread('D:\数模美赛\rtn.xlsx',1,'D2:D12');
for i=1:n
    X=[X;zhishu2(X)];
end
for j=1:length(X)
    if X(j)<0
        X(j)=0;
    end
    if X(j)>100
        X(j)=100;
    end
end
plot(t,X,'linewidth',2);
Xnewspaper=X;
%% computer
X=xlsread('D:\数模美赛\rtn.xlsx',1,'B14:B19');
    for i=1:7
        X=[X;zhishu2(X)];
    end
     for j=1:length(X)
        if X(j)<0
            X(j)=0;
        end
        if X(j)>100
            X(j)=100;
        end
    end
tc=[1990 1995 2000 2005 2010 2014 2020:5:2050];
plot(tc,X,'linewidth',2);
Xcomputer=X;
%% smart phone
X=xlsread('D:\数模美赛\rtn.xlsx',1,'B21:B24')
    for i=1:36
        X=[X;zhishu2(X)];
    end
     for j=1:length(X)
        if X(j)<0
            X(j)=0;
        end
        if X(j)>100
            X(j)=100;
        end
    end
ts=[2011:2050];
plot(ts,X,'linewidth',2);
Xsmartphone=X;

