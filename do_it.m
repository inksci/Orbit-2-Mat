% notice here!
r2=r(:,2);

sigma2=dot(r2,v2)/sqrt(mu);
daoshu=2/norm(r2)-dot(v2,v2)/mu;

% �������
sigma1=sigma2/2;
sigma3=sigma2/2;

