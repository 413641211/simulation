function y=dis_rand(x,p,n)
%dis_rand ������ɢ�ֲ��������Զ�
% x������ȡֵ
% p��ȡֵ����
% n������������Զ�����Ŀ
cp=cumsum(p);
y=zeros(n,2);
for i=1:n
    y(i,:)=x(sum(cp<=rand(1))+1,:);
end

% �˺����޸ĵ�����
% function y=dis_rand(x,p,n)
% %dis_rand ������ɢ�ֲ������
% % x������ȡֵ
% % p��ȡֵ����
% % n�����������������Ŀ
% cp=cumsum(p);
% y=zeros(1,n);
% for i=1:n
%     y(i)=x(sum(cp<=rand(1))+1);
% end