%use Runge-kutta method to solve IVP

function y=rk(t,f,alpha) 

y(1)=alpha;
for i=1:length(t)-1
    h=t(i+1)-t(i);
    k1=h*f(t(i),y(i));
    k2=h*f(t(i)+h/2,y(i)+k1/2);
    k3=h*f(t(i)+h/2,y(i)+k2/2);
    k4=h*f(t(i)+h,y(i)+k3);
    y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
    
end
end 
