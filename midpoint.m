%use eulers method to solve IVP

function y=midpoint(t,f,alpha) 
y(1)=alpha;
for i=1:length(t)-1
    h=t(i+1)-t(i);
    k1=h*f(t(i),y(i));
    y(i+1)=y(i)+h*f(t(i)+h/2,y(i)+k1/2);
end
end 
