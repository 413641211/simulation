function [theServiceBaseStation,class]=findtheServiceBaseStation(user,eNBs,HeNBs)
%����RSS
RSSofeNBs=calculate_RSS(user,eNBs);
RSSofHeNBs=calculate_RSS(user,HeNBs);
%ѡ�����վ
theServiceBaseStation1=1;
theServiceBaseStation2=1;
for i=1:size(RSSofeNBs)
    if RSSofeNBs(i)>theServiceBaseStation1
        theServiceBaseStation1=i;
    end
end
for j=1:size(RSSofHeNBs)
    if RSSofHeNBs(i)>theServiceBaseStation2
        theServiceBaseStation2=j;
    end
end
if RSSofeNBs(theServiceBaseStation1)>RSSofHeNBs(theServiceBaseStation2)+50%�Ӷ��٣�
    theServiceBaseStation=theServiceBaseStation1;
    class='eNBs';
else
    theServiceBaseStation=theServiceBaseStation2;
    class='HeNBs';
end
end