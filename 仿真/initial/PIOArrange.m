function [pois,gates,restaurants,shops,offices,flats]=PIOArrange()
%����POIs
x=[0,16,216,232,382,398,473,489,564,580];
y=[0,16,166,182,198,273,348,364];
pois=[;];
for i=1:10
    for j=1:8
        pois=[pois;x(i),y(j)];
    end
end
othergates=[0,176;0,265;580,176;580,265;224,0;224,364;390,0;390,364;481,0;481,364];
restaurants=[216,207;100,16];%����
shops=[524,273;398,30];%����
offices=[473,140;232,300];%����
flats=[;];
for i=1:5%10����ѭ��5�Σ�ÿ�β�������
num1=randperm(10,1);
flats=[flats;x(num1),364*rand()];
num2=randperm(8,1);
flats=[flats;580*rand(),y(num2)];
end

pois=[pois;othergates;flats;offices;shops;restaurants;];
gates=[othergates;0,0;0,364;580,0;580,360];%14��
% for j=1:size(pois)
%     plot(pois(j,1),pois(j,2),'.');
%     hold on;
% end
end