function user=Manhattan_mobility_model(Path,pois)
t_run=0;
PathSize=size(Path);
for s=1:PathSize
    des=Path(s);
    point=pois(des,:);
    while (point(1)~=user(1)&&t_run<1)%������
        user(1)=user(1)+1*(point(1)-user(1))/abs(point(1)-user(1));%����������
        user(2)=user(2);
        t_run=t_run+1;
    end
    while(point(2)~=user(2)&&t_run<1)%������
        user(2)=user(2)+1*(point(2)-user(2))/abs(point(2)-user(2));%����������
        user(1)=user(1);
        t_run=t_run+1;
    end
end
end