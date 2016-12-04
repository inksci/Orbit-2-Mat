p=[1 0 a 0 0 b 0 0 c]; % high to low
x=roots(p);

x_fetch=[];
for i=1:length(x)
    if imag(x(i))~=0
        continue;
    end
    if real(x(i))<0
        continue;
    end
    
    x_fetch=[x_fetch real(x(i))];
end
if length(x_fetch)~=1
    error('length(x_fetch)~=1');
end

r2=x_fetch;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% now, use r2
run;