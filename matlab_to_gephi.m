%this code is working for transform matlab matrix to Gephi.
%input data is a undirected distance matrix(n*n) or a similarity matrix.
%input label is label for node.
% output are two files, edglist.xls and node.xls.
%created by kexin wang. versions 1.0
%example: data=[0 2 3;2 0 4; 3 4 0];
%         node_label={'a','b','c'};

%note:fiest use excel  transforming edglist.xls and node.xls to a .csv file.
%then loading node.csv file by Gephi, after that loading edglist.csv file.
% DO NOT CHOOSE "create missing nodes",when you load edglist.csv file!


function []=matlab_to_gephi(data,node_label)

%-----------------------------building nodes.csv---------------------------
num_node=size(node_label,2);
node=cell(num_node+1,2);
node{1,1}='Id';
node{1,2}='Label';
for i_node=1:num_node
    node{i_node+1,1}=i_node;
    node{i_node+1,2}=node_label{i_node};
end
% filename=who('node_label');
xlswrite('gephi_node.xls',node)% save as gephi_node.xls

%-------------building soucre and target value for edglist-----------------
%creating fully connection matrix.
n_row =size(data,1);
edglist1=1:n_row;
edglist1=repmat(edglist1,1,n_row);
    list1=1;
for list2=1:n_row
    edglist2(list1:list2*n_row)=list2;
    list1=list1+n_row;
end
edglist=[edglist1;edglist2]';

%writing edge weighing values
data_1=data(:);
edglist(:,3)=data_1;
%deleting the edgelist's value, which distance is equal to zero
[r,~]=find(edglist==0);
edglist(r,:)=[];
%adding title for edglist.xls
edglist=num2cell(edglist);
edglist_final=cell(size(edglist,1)+1,3);
edglist_final{1,1}='Source';
edglist_final{1,2}='Target';
edglist_final{1,3}='Weight';
%creating final_edglist.xls
size_ed=size(edglist,1);
for n_ed=1:size_ed
   edglist_final{n_ed+1,1}=edglist{n_ed,1};
   edglist_final{n_ed+1,2}=edglist{n_ed,2};
   edglist_final{n_ed+1,3}=edglist{n_ed,3};
end
% filename=who('data');
xlswrite('gephi_edglist.xls',edglist_final)% save as gephi_edglist.xls
end


