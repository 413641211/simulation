function UG=calculateWeight(user,pois)%
%�ж�user�Ƿ���pois����û����ӽ�ȥ
a=0;
for k=1:size(pois,2)
if (user-pois(k,:))==[0,0]
    a=a+1;
end
end
if a==0
    pois=[pois;user];
end
%calculateWeight
W=[];
for i=1:size(pois)
    for j=1:size(pois)
    W(i,j)=abs(pois(i,1)-pois(j,1))+abs(pois(i,2)-pois(j,2));
    end
end
%Ȩֵ�ͱ߶�Ӧ�õ�UG
Vector1=[];
Vector2=[];
for i=1:size(pois)
    Vector1=[Vector1,i*ones(1,size(pois,1))];
    Vector2=[Vector2,1:size(pois,1)];
end
UG = sparse(Vector1,Vector2,W);
end