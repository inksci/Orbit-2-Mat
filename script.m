% notice here!
r2=r(:,2);

sigma2=dot(r2,v2)/sqrt(mu);
daoshu=2/norm(r2)-dot(v2,v2)/mu;

% 迭代求解
sigma1=sigma2/2;
sigma3=sigma2/2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_sigma=[0 0 0 0]; % initialize it
for i=1:100
    x_sigma_old=x_sigma;
    x1=daoshu*sqrt(mu)*(t1-t2)+(sigma1-sigma2);
    x3=daoshu*sqrt(mu)*(t3-t2)+(sigma3-sigma2);
    sigma1=sigma2*U(0,x1,daoshu)+(1-daoshu*norm(r2))*U(1,x1,daoshu);
    sigma3=sigma2*U(0,x3,daoshu)+(1-daoshu*norm(r2))*U(1,x3,daoshu);
    x_sigma=[x1 x3 sigma1 sigma3];
end
% % disp('=====      x_sigma minus x_sigma_old      =====')
% % x_sigma-x_sigma_old


%%%%%%%%%%%%%%%%%%%%%%%%
x1=x_sigma(1);
x3=x_sigma(2);
sigma1=x_sigma(3);
sigma3=x_sigma(4);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FG_old=FG_new;

F1=1-U(2,x1,daoshu)/norm(r2);
F3=1-U(2,x3,daoshu)/norm(r2);
G1=norm(r2)/sqrt(mu)*U(1,x1,daoshu)+sigma2/sqrt(mu)*U(2,x1,daoshu);
G3=norm(r2)/sqrt(mu)*U(1,x3,daoshu)+sigma2/sqrt(mu)*U(2,x3,daoshu);

FG_new=[F1 F3 G1 G3];
wn=0.7;
F1=wn*FG_old(1)+(1-wn)*FG_new(1);
F3=wn*FG_old(2)+(1-wn)*FG_new(2);
G1=wn*FG_old(3)+(1-wn)*FG_new(3);
G3=wn*FG_old(4)+(1-wn)*FG_new(4);

C1=G3/(F1*G3-F3*G1);
C3=-G1/(F1*G3-F3*G1);

% 重新计算斜距rou和状态量r2 v2
rou(1)=-D(1,1)+1/C1*D(1,2)-C3/C1*D(1,3);
rou(2)=C1*D(2,1)-D(2,2)+C3*D(2,3);
rou(3)=-C1/C3*D(3,1)+1/C3*D(3,2)-D(3,3);

for i=1:3
   r(:,i)=rou(i)*rou0(:,i)+R(:,i);
end
% 这里做了改变：F03 -> F3， 可能原因就在这儿
v2=( F1*r(:,3)-F3*r(:,1) )/( F1*G3-F3*G1 );