function out=U(n,x,a)
% �ͽ���Ǿ�ȷֵ
out=x^n*( 1/factorial(n)-a*x^2/factorial(n+2)+(a*x^2)^2/factorial(n+4) );