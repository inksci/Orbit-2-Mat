rou_keep=[];
for i=1:60
    script; rou_keep=[rou_keep rou(2)];
end
plot(1:length(rou_keep),rou_keep,'.')
xlabel('迭代次数')
ylabel('距离')
title('中间时刻，卫星与测站的距离计算值')
disp('============  精度：中间时刻，卫星与测站的距离计算值（第k次与第k-1次的差）   ================')
rou_keep(end)-rou_keep(end-1)
r2,v2
disp('============  3个时刻，卫星与测站的距离   ================')
rou