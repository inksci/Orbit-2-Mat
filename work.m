rou_keep=[];
for i=1:60
    script; rou_keep=[rou_keep rou(2)];
end
plot(1:length(rou_keep),rou_keep,'.')
xlabel('��������')
ylabel('����')
title('�м�ʱ�̣��������վ�ľ������ֵ')
disp('============  ���ȣ��м�ʱ�̣��������վ�ľ������ֵ����k�����k-1�εĲ   ================')
rou_keep(end)-rou_keep(end-1)
r2,v2
disp('============  3��ʱ�̣��������վ�ľ���   ================')
rou