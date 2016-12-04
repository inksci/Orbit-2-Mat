x_sigma=[0 0 0 0]; % initialize it
for i=1:100
    x_sigma_old=x_sigma;
    x1=daoshu*sqrt(mu)*(t1-t2)+(sigma1-sigma2);
    x3=daoshu*sqrt(mu)*(t3-t2)+(sigma3-sigma2);
    sigma1=sigma2*U(0,x1,daoshu)+(1-daoshu*norm(r2))*U(1,x1,daoshu);
    sigma3=sigma2*U(0,x3,daoshu)+(1-daoshu*norm(r2))*U(1,x3,daoshu);
    x_sigma=[x1 x3 sigma1 sigma3];
end
disp('=====      x_sigma minus x_sigma_old      =====')
x_sigma-x_sigma_old


%%%%%%%%%%%%%%%%%%%%%%%%
exec;