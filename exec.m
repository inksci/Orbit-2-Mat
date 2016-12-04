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
