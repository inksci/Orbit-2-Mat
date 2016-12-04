rou(1)=-D(1,1)+1/C1*D(1,2)-C3/C1*D(1,3);
rou(2)=C1*D(2,1)-D(2,2)+C3*D(2,3);
rou(3)=-C1/C3*D(3,1)+1/C3*D(3,2)-D(3,3);

for i=1:3
   r(:,i)=rou(i)*rou0(:,i)+R(:,i);
end

v2=( F01*r(:,3)-F03*r(:,1) )/( F01*G03-F03*G01 );

% notice here!
r2=r(:,2);

sigma2=dot(r2,v2)/sqrt(mu);
daoshu=2/norm(r2)-dot(v2,v2)/mu;

% µü´úÇó½â
sigma1=sigma2/2;
sigma3=sigma2/2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for_it;