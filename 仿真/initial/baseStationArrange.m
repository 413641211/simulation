function [eNBs,HeNBs]=baseStationArrange(numberofHeNB)
w_town=530;
h_town=364;%�ĳ�300��
%drawTown(0,0,150)һ��3��
rectangle('Position',[0,0,w_town,h_town]);hold on;
rectangle('Position',[16,16,200,150]);hold on;
rectangle('Position',[232,16,150,150]);hold on;
rectangle('Position',[398,16,75,150]);hold on;
rectangle('Position',[489,16,75,150]);hold on ;
rectangle('Position',[16,182,200,150]);hold on;
rectangle('Position',[16,348,200,75]);hold on;
rectangle('Position',[16,439,200,75]);hold on;
%�ĸ�΢΢��վ��λ������
eNBs=[50,400,5,1;200,0,5,1;400,400,5,1;500,200,5,1];
%����HeNB
x=[21,237,403,494,211,377,468,559];%[16,232,398,489]+5;����[216,382,473,564,]-5;
y=[21,187,278,161,193,343];%[16,182,273]+[5,5,5]����[166,198,348]-[5,5,5]

HeNBs=[];
for i=1:numberofHeNB/2%ÿ�β�������
    num1=randperm(8,1);
    HeNBs=[HeNBs;x(num1),364*rand(),randperm(4,1),1];%�����б�ʾλ�ó���---1flat;2office;3shop;4restaurant
    num2=randperm(6,1);
    HeNBs=[HeNBs;580*rand(),y(num2),randperm(4,1),1];
end
%position=['flat','office','shop','restaurant'];
%����¥��,����flat������¥�㶼Ϊ1
for numHeNB=1:size(HeNBs)
    if HeNBs(numHeNB,3)==1
        numoffloor=randperm(5,1);
        HeNBs(numHeNB,4)=numoffloor;
    end
end
%plot
for numeNB=1:size(eNBs)%��΢΢��վ
    plot(eNBs(numeNB,1),eNBs(numeNB,2),'o');
    hold on;
end
for numHeNB=1:size(HeNBs)%����ͥ��վ
    plot(HeNBs(numHeNB,1),HeNBs(numHeNB,2),'X');
    hold on;
end
end