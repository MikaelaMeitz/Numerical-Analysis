%calculate integral of f using midpoint rule

function op=intmidp(x,f)
op=0;
for i=2:2:length(x)-1
    op=op+2*f(i)*(x(i)-x(i-1));
end
end
