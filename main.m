H=0;
B=25 *pi/180;
e=0.081819;
ae=6378.14e3;
s_mat=[30.0000000000000
    30.2089037311346
    30.4178074622692
    30.6267111934038
    30.8356149245385
    31.0445186556731
    31.2534223868077
    31.4623261179423
    31.6712298490769
    31.8801335802115
    ] *pi/180;
xE=( ae/sqrt(1-e^2*sin(B)^2) + H )*cos(B);
zE=( ae*(1-e^2)/sqrt(1-e^2*sin(B)^2) + H )*sin(B);
for i=1:10
    s=s_mat(i);
    R_tab(:,i)=[xE*cos(s), xE*sin(s), zE]';
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��γ
delta_mat=[-17.0548123641637
    -20.8048936911459
    -24.0865591068338
    -26.9867702924472
    -29.5739579461194
    -31.9022659777445
    -34.0143342660431
    -35.942688091854
    -37.7114057115184
    -39.3407353275426
    ] *pi/180;
alpha_mat=[76.7906019518989
    79.1621526037573
    81.4251880186647
    83.609279781831
    85.7377454792218
    87.8322383098714
    89.9036484253114
    91.9650611327968
    94.0274224000819
    96.0960063598604
    ] *pi/180;
for i=1:10
    delta=delta_mat(i);
    alpha=alpha_mat(i);
    lambd=cos(delta)*cos(alpha);
    eta=cos(delta)*sin(alpha);
    upsilon=sin(delta);
    rou0_tab(:,i)=[lambd, eta, upsilon]';
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=0;
t2=50;
t3=100;
tou1=t1-t2;
tou3=t3-t2;
tou=tou3-tou1;
R=R_tab(:,[1 2 3]);
rou0=rou0_tab(:,[1 2 3]);
D=rou0\R;
A=1/tou*(D(2,1)*tou3-D(2,2)*tou-tou1*D(2,3));
B=1/2/tou*( D(2,1)*tou3*(tou^2-tou3^2)-D(2,3)*tou1*(tou^2-tou1^2) );
a=-( A^2+2*A*dot(R(:,2),rou0(:,2))+dot(R(:,2),R(:,2)) );
mu=6.67e-11*5.965e24;
b=-2*mu*B*(A+dot(R(:,2),rou0(:,2)));
c=-mu^2*B^2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a b c => r2