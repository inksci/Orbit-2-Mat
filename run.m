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




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
do_it;
rou_old=rou+100;
while abs( (rou(2)-rou_old(2)) )>=1
    do_it;rou_old-rou, rou_old=rou;
end
