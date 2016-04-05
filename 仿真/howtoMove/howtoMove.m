function Path=howtoMove(user,users,UG,pois,poisofRoamingResidents,gates,restaurants,shops,offices,flats)%？？？？取得的[x_user,y_user]还有问题
n=1;%dis_rand参数
PositioninUsers=findPositioninPOIs(user,users);
%worker
if PositioninUsers>=1&&PositioninUsers<=18%worker-起始位置就在出入口，不用选入口-出口和入口一样
    Enter=user;
    %-------------1.分配工作地址-----------------
    x_work=[restaurants;shops;offices];
    p_work=[0.05;0.05;0.05;0.05;0.4;0.4];
    workplace=dis_rand(x_work,p_work,n);
    %-----------2.计算最短路程--------------
    %上班
    x_onwork=[workplace;shops];
    p_onwork=[0.9,0.05,0.05];
    destinationmidway_onwork=dis_rand(x_onwork,p_onwork,n);
    Path_Midway_onwork=getShortestPath(findPositioninPOIs(Enter,pois),findPositioninPOIs(destinationmidway_onwork,pois),UG);
    Path_onwork=[Path_Midway_onwork,getShortestPath(findPositioninPOIs(destinationmidway_onwork,pois),findPositioninPOIs(workplace,pois),UG)];
    %下班
    x_offwork=[Enter;shops;restaurants];
    p_offwork=[0.6,0.1,0.1,0.1,0.1];
    destinationmidway_offwork=dis_rand(x_offwork,p_offwork,n);
    Path_Midway_offwork=getShortestPath(findPositioninPOIs(workplace,pois),findPositioninPOIs(destinationmidway_offwork,pois),UG);
    Path_offwork=[Path_Midway_offwork,getShortestPath(findPositioninPOIs(destinationmidway_offwork,pois),findPositioninPOIs(Enter,pois),UG)];
    Path=[Path_onwork,Path_offwork];
    %resident
elseif 19<=PositioninUsers&&PositioninUsers<=42
    Home=user;
    %分配离开本区域去工作的gate
    x_work=gates;
    p_work=1/14*ones(1,14);
    gatetoLeave=dis_rand(x_work,p_work,n);
    %-----------2.计算最短路程--------------
    %上班
    x_onwork=[gatetoLeave;shops];
    p_onwork=[0.5,0.25,0.25];
    destinationmidway_onwork=dis_rand(x_onwork,p_onwork,n);
    Path_Midway_onwork=getShortestPath(findPositioninPOIs(Home,pois),findPositioninPOIs(destinationmidway_onwork,pois),UG);
    Path_onwork=[Path_Midway_onwork,getShortestPath(findPositioninPOIs(destinationmidway_onwork,pois),findPositioninPOIs(gatetoLeave,pois),UG)];
    %下班
    x_offwork=[Home;shops;restaurants];
    p_offwork=[0.6,0.1,0.1,0.1,0.1];
    destinationmidway_offwork=dis_rand(x_offwork,p_offwork,n);
    Path_Midway_offwork=getShortestPath(findPositioninPOIs(gatetoLeave,pois),findPositioninPOIs(destinationmidway_offwork,pois),UG);
    Path_offwork=[Path_Midway_offwork,getShortestPath(findPositioninPOIs(destinationmidway_offwork,pois),findPositioninPOIs(Home,pois),UG)];
    %下班后
    x_downwork=[Home;shops;restaurants];
    p_downwork=[0.4,0.15,0.15,0.15,0.15];
    destination_downwork=dis_rand(x_downwork,p_downwork,n);
    Path_downwork=getShortestPath(findPositioninPOIs(Home,pois),findPositioninPOIs(destination_downwork,pois),UG);
    %购物或用餐结束回家
    Path_goHome=getShortestPath(findPositioninPOIs(destination_downwork,pois),findPositioninPOIs(Home,pois),UG);
    Path=[Path_onwork,Path_offwork,Path_downwork,Path_goHome];
elseif   43<=PositioninUsers&&PositioninUsers<=54%visitors
    Enter=user;
    %选出口
    x=gates;
    p=1/14*ones(1,14);
    gatetoLeave=dis_rand(x,p,n);
    %-------------1.选择去哪儿游玩-----------------
    x_work=[restaurants;shops;offices;flats;gatetoLeave];
    p_work=[0.125;0.125;0.125;0.125;0.025;0.025;0.02;0.02;0.02;0.02;0.02;0.02;0.02;0.02;0.02;0.02;0.5];
    placetoVisit=dis_rand(x_work,p_work,n);
    %-----------2.计算最短路程--------------
    Path_Midway_visit=getShortestPath(findPositioninPOIs(Enter,pois),findPositioninPOIs(placetoVisit,pois),UG);
    Path_visit=[Path_Midway_visit,getShortestPath(findPositioninPOIs(placetoVisit,pois),findPositioninPOIs(gatetoLeave,pois),UG)];
    Path=[Path_Midway_visit,Path_visit];
else%roamingresidents
    Path=[];
    theNumberofPOI=randperm(48,1);
    id = randperm(48,theNumberofPOI);
    roamingresidentsPOI = poisofRoamingResidents(id,:);
    thePOI=[user;roamingresidentsPOI];
    for i=1:size(thePOI)
        Path=[Path,getShortestPath(thePOI(i),thePOI(i+1))];
    end
end
end