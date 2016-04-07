%initial the parameters of network
[pois,poisofRoamingResidents,gates,restaurants,shops,offices,flats]=PIOArrange();
[UG,W]=calculateWeight(pois);
%����΢΢��վ�ͼ�ͥ��վ
numberofHeNB=30;%numberofHeNB=30:30:120;%numberofeNB=4;
[eNBs,HeNBs]=baseStationArrange(numberofHeNB);%BaseStations=[eNBs;HeNBs];
%�û�����
numberOfUsers=60;%Ӧ����60��
users=userMake(numberOfUsers,flats);
%��ʼ���л�ͳ�ƾ���
count_handover_number=zeros(numberofHeNB);
for u=1:numberOfUsers-59
    record_time=0;%record the number of interval time of user
    %ѡ������վ
    [theServiceBaseStation,class]=findtheServiceBaseStation(users(u,:),eNBs,HeNBs);
    Path=howtoMove(users(u,:),u,UG,pois,poisofRoamingResidents,gates,restaurants,shops,offices,flats);
    while record_time<10
        PathSize=size(Path,2);
        %�������ƶ�ģ��
        while PathSize>0
            des=Path(1);
            point=pois(des,:);
            plot(users(u,1),users(u,2),'Marker','s','Color','r');
            while users(u,1)~=point(1)||users(u,2)~=point(2)
                users(u,:)=Manhattan_mobility_model(users(u,:),point);
                %����ѡ������վ
                [theServiceBaseStationNew,classNew]=findtheServiceBaseStation(users(u,:),eNBs,HeNBs);
                if theServiceBaseStationNew~=theServiceBaseStation&&strcmp(class,'HeNBs')&&strcmp(classNew,'HeNBs')%�����л�
                    x1=HeNBs(theServiceBaseStation,:);
                    y1=HeNBs(theServiceBaseStationNew,:);
                    plot(users(u,1),users(u,2),'Marker','s','Color','r');
                    plot(x1(1),x1(2),'Marker','d','Color','y');
                    plot(y1(1),y1(2),'Marker','*','Color','r');
                    count_handover_number(theServiceBaseStation,theServiceBaseStationNew)=count_handover_number(theServiceBaseStation,theServiceBaseStationNew)+1;
                    count_handover_number(theServiceBaseStationNew,theServiceBaseStation)=count_handover_number(theServiceBaseStationNew,theServiceBaseStation)+1;
                    theServiceBaseStation=theServiceBaseStationNew;
                    class=classNew;
                end
                record_time=record_time+1;
            end
            Path(1)=[];
            PathSize=PathSize-1;
        end
    end
    %������Ҫһ��count_handover_number�ľ���
end