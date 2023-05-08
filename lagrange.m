%create lagrange polynomial 

function pout = lagrange(x,f)
pout=0;
  for k=1:length(x)
        Lnk = 1;
for i=1: length(x) 
    if i ~= k 
        Lnk = conv([1 -x(i)],Lnk)/(x(k)-x(i));
    end
end
pout=pout+f(k)* Lnk;
  end
end 
