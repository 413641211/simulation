function users=userMake(numberOfUsers)
%��໹�����
xStreet=[0,250,400,450,500];%��·�ӵ����߸ĳ���˫���ߣ�x,y�ֱ���������16�ģ�16��266��416�ȣ�
yStreet=[0,200,300,400];
users=[;];
for i=1:numberOfUsers/2
%ѡȡ����ֵ�
numofVerticalStreet=randperm(5,1);%��1-5�У����ѡһ����
users=[users;xStreet(numofVerticalStreet),round(400*rand())];%round��֤�û�������Ҳ��������
%ѡȡ����ֵ�
numofHorizontalStreet=randperm(4,1);
users=[users;round(500*rand()),yStreet(numofHorizontalStreet)];
end
% for j=1:numberOfUsers
%     plot(users(j,1),users(j,2),'.');
%     hold on;
% end

%Worker��30%����Resident��40%����Visitor��20%����Roaming resident��10%��
numberOfWorkers=numberOfUsers*0.3;%%worker\visitor�ʼӦ��ֻ��gates���������Ҫһ��
workers=users(1:numberOfUsers*0.3,:);%18(1-18)
numberOfResidents=numberOfUsers*0.4;%��gates��ʼ
residents=users(numberOfUsers*0.3+1:numberOfUsers*0.7,:);%24(19-42)
numberOfVisitors=numberOfUsers*0.2;
visitors=users(numberOfUsers*0.7+1:numberOfUsers*0.9,:);%12(43-54)%����ڶ���gates����Ҫ���Բ�һ��
numberOfRoamingresidents=numberOfUsers*0.1;
roamingresidents=users(numberOfUsers*0.9+1:numberOfUsers,:);%6(55-60)�ʼ�ĵ�Ҳ���������ĵ�
end


