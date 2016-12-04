for i=1:10
    x1=daoshu*sqrt(mu)*(t1-t2)+(sigma1-sigma2);
    x3=daoshu*sqrt(mu)*(t3-t2)+(sigma3-sigma2);
    sigma1=sigma2*U(0,x1,daoshu)+(1-daoshu*norm(r2))*U(1,x1,daoshu);
    sigma3=sigma2*U(0,x3,daoshu)+(1-daoshu*norm(r2))*U(1,x3,daoshu);
    [x1 x3 sigma1 sigma3]
end
