%algorithm
%handoverStatistics=handoverStatistics();
handoverStatistics=[4,0,1;0,9,4;8,2,0];
%�������֡������л���
handoverDegree=zeros(1,size(handoverStatistics,1));
neighborList={};
for i=1:size(handoverStatistics,1)
    a=[];
    for j=1:size(handoverStatistics,1)
        if handoverStatistics(i,j)~=0
            a=[a,j];
            handoverDegree(i)=handoverDegree(i)+handoverStatistics(i,j);
        end
    end
    neighborList{i}=a;
end
%form cluster
k=size(handoverStatistics,1);
clusterHead=[];
cluster={};
t=1;
while k>0
    %ѡ��ͷ
    m=find(max(handoverDegree));
    clusterHead(t)=m;
    %ѡ�س�Ա�γɴ�
    b=m;
    cluster{t}=b;
    neighbor=neighborList{m};
    for n=1:size(neighbor,2)
        yyyy=0;
        for c=1:size(cluster{t},2)
            yyyy=yyyy+cluster{t}(c);
        end
            if handoverDegree(neighbor(n))-yyyy>yyyy
                b=[b,neighbor(n)];
            end
        t=t+1;
        k=k-size(cluster);
    end
end