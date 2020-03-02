
clear;
clc;

OutlookType=struct('Sunny',1,'Rainy',2,'Overcast',3);
TemperatureType=struct('hot',1,'warm',2,'cool',3);
HumidityType=struct('high',1,'norm',2);
WindyType={'True',1,'False',0};
PlayGolf={'Yes',1,'No',0};
data=struct('Outlook',[],'Temperature',[],'Humidity',[],'Windy',[],'PlayGolf',[]);

Outlook=[1,1,3,2,2,2,3,1,1,2,1,3,3,2]';
Temperature=[1,1,1,2,3,3,3,2,3,3,2,2,1,2]';
Humidity=[1,1,1,1,2,2,2,1,2,2,2,1,2,1]';
Windy=[0,1,0,0,0,1,1,0,0,0,1,1,0,1]';

data=[Outlook Temperature Humidity Windy];
PlayGolf=[0,0,1,1,1,0,1,0,1,1,1,1,1,0];
propertyName={'Outlook','Temperature','Humidity','Windy'};
delta=0.1;
decisionTreeModel=decisionTree(data,PlayGolf,propertyName,delta);

function decisionTreeModel=decisionTree(data,label,propertyName,delta)

global Node;

Node=struct('fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);
BuildTree('root','Stem',data,label,propertyName,delta);
Node(1)=[];
model.Node=Node;
decisionTreeModel=model;
%递归构建树
end

function BuildTree(fatherNodeName,edge,data,label,propertyName,delta)

global Node;
sonNode=struct('fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);
sonNode.fatherNodeName=fatherNodeName;
sonNode.EdgeProperty=edge;
if length(unique(label))==1
    sonNode.NodeName=label(1);
    Node=[Node sonNode];
    return;
end
if length(propertyName)<1
    labelSet=unique(label);
    k=length(labelSet);
    labelNum=zeros(k,1);
    for i=1:k
        labelNum(i)=length(find(label==labelSet(i)));
    end
    [~,labelIndex]=max(labelNum);
    sonNode.NodeName=labelSet(labelIndex);
    Node=[Node sonNode];
    return;
end
[sonIndex,BuildNode]=CalcuteNode(data,label,delta);
if BuildNode
    dataRowIndex=setdiff(1:length(propertyName),sonIndex);
    sonNode.NodeName=propertyName{sonIndex};
    Node=[Node sonNode];
    propertyName(sonIndex)=[];
    sonData=data(:,sonIndex);
    sonEdge=unique(sonData);
    
    for i=1:length(sonEdge)
        edgeDataIndex=find(sonData==sonEdge(i));
        BuildTree(sonNode.NodeName,sonEdge(i),data(edgeDataIndex,dataRowIndex),label(edgeDataIndex,:),propertyName,delta);
    end
else
    labelSet=unique(label);
    k=length(labelSet);
    labelNum=zeros(k,1);
    for i=1:k
        labelNum(i)=length(find(label==labelSet(i)));
    end
    [~,labelIndex]=max(labelNum);
    sonNode.NodeName=labelSet(labelIndex);
    Node=[Node sonNode];
    return;
end
end
%计算下一个树节点的特征

function [NodeIndex,BuildNode]=CalcuteNode(data,label,delta)

LargeEntropy=CEntropy(label);
[m,n]=size(data);
EntropyGain=LargeEntropy*ones(1,n);
BuildNode=true;
for i=1:n
    pData=data(:,i);
    itemList=unique(pData);
    for j=1:length(itemList)
        itemIndex=find(pData==itemList(j));
        EntropyGain(i)=EntropyGain(i)-length(itemIndex)/m*CEntropy(label(itemIndex));
    end
    % 此处运行则为增益率，注释掉则为增益
    % EntropyGain(i)=EntropyGain(i)/CEntropy(pData); 
end
[maxGainEntropy,NodeIndex]=max(EntropyGain);
if maxGainEntropy<delta
    BuildNode=false;
end
end
%计算熵

function result=CEntropy(propertyList)

result=0;
totalLength=length(propertyList);
itemList=unique(propertyList);
pNum=length(itemList);
for i=1:pNum
    itemLength=length(find(propertyList==itemList(i)));
    pItem=itemLength/totalLength;
    result=result-pItem*log2(pItem);
end

end