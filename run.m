% a b c => r2

F01=1-mu/2/r2^3*tou1^2;
G01=tou1-mu/6/r2^3*tou1^3;

F03=1-mu/2/r2^3*tou3^2;
G03=tou3-mu/6/r2^3*tou3^3;

F1=F01;F3=F03;G1=G01;G3=G03; % notice here!
FG_new=[F1 F3 G1 G3];

u2=mu*r2^(-3);
C1=tou3/tou*(1+1/6*u2*(tou^2-tou3^2));
C3=-tou1/tou*(1+1/6*u2*(tou^2-tou1^2));

rou(1)=-D(1,1)+1/C1*D(1,2)-C3/C1*D(1,3);
rou(2)=C1*D(2,1)-D(2,2)+C3*D(2,3);
rou(3)=-C1/C3*D(3,1)+1/C3*D(3,2)-D(3,3);

for i=1:3
   r(:,i)=rou(i)*rou0(:,i)+R(:,i);
end

v2=( F01*r(:,3)-F03*r(:,1) )/( F01*G03-F03*G01 );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_it;