function [destination,Path]=howtoMove(user,pois,gates,restaurants,shops,offices,flats)%worker��%��������ȡ�õ�[x_user,y_user]��������
%######################ȥ����--worker��ʼλ�þ��ڳ���ڣ����Բ���ѡ���#
%-------------ѡ���-----------------
n=1;
enter=user;
exit=user;%����--�����һ��
UG=calculateWeight(user,pois)
%-------------1.ѡ�����ص�-----------------%4�ֲ�ͬ�û���1��2��һ��
x=[restaurants;shops;offices];
p=[0.05;0.05;0.05;0.05;0.4;0.4];
destination=dis_rand(x,p,n);
%-----------2.�������·��--------------
x_onwork=[destination;shops];
p_onwork=[0.9,0.05,0.05];
destinationmidway=dis_rand(x_onwork,p_onwork,n);
Path_Midway=getShortestPath(findPositioninPOIs(user,pois),findPositioninPOIs(destinationmidway,pois),UG);
Path=[Path_Midway,getShortestPath(findPositioninPOIs(destinationmidway,pois),findPositioninPOIs(destination,pois),UG)];
end