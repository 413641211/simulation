function [eNBs,HeNBs]=baseStationArrange(numberofHeNB)
w_town=580;
h_town=364;
% rectangle('Position',[0,0,w_town,h_town]);hold on;
% rectangle('Position',[16,16,200,150]);hold on;
% rectangle('Position',[232,16,150,150]);hold on;
% rectangle('Position',[398,16,75,150]);hold on;
% rectangle('Position',[489,16,75,150]);hold on ;
% rectangle('Position',[16,182,200,75]);hold on;
% rectangle('Position',[16,273,200,75]);hold on;
% rectangle('Position',[232,182,150,75]);hold on;
% rectangle('Position',[232,273,150,75]);hold on;
% rectangle('Position',[398,182,75,75]);hold on;
% rectangle('Position',[398,273,75,75]);hold on;
% rectangle('Position',[489,182,75,75]);hold on;
% rectangle('Position',[489,273,75,75]);hold on;
axis equal;
axis off;
axis([0 580 0 364]);
%�ĸ�΢΢��վ��λ������
eNBs=[100,340,5,1;240,50,5,1;375,340,5,1;550,190,5,1];
%����HeNB
x=[31,247,413,504,201,367,458,549];%[16,232,398,489]+5;����[216,382,473,564,]-5;
y=[31,197,288,151,183,333];%[16,182,273]+[5,5,5]����[166,198,348]-[5,5,5]
randomNumber=rand(1,numberofHeNB);
HeNBs=[];
for i=1:numberofHeNB/2%ÿ�β�������
    num1=randperm(8,1);
    HeNBs=[HeNBs;x(num1),16+327*randomNumber(i),randperm(4,1),1];%�����б�ʾλ�ó���---1flat;2office;3shop;4restaurant
    num2=randperm(6,1);
    HeNBs=[HeNBs;16+543*randomNumber(1+numberofHeNB/2),y(num2),randperm(4,1),1];
end
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