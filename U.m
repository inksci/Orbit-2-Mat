function out=U(n,x,a)
% 低阶项，非精确值
out=x^n*( 1/factorial(n)-a*x^2/factorial(n+2)+(a*x^2)^2/factorial(n+4) );