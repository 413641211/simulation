function user=Manhattan_mobility_model(user,point)
t_run=0;
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