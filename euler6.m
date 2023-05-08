%Use Eulers Method to solve initial value problem (order 6)  

function y=euler6(t,f,fp,fpp,f3,f4,f5,alpha)

% y'=f(t,y)
% y(t(1))= alpha
    y(1)= alpha;
    for i=1:length(t)-1
        % y(ti+1) = y(ti)+ hf(ti, y(ti))
        y(i+1) = y(i)+ (t(i+1)-t(i))*fp(t(i),y(i));
        y(i+1) = y(i+1) +0.5*(t(i+1)-t(i))^2*fp(t(i),y(i));
        y(i+1) = y(i+1) +(1/6)*(t(i+1)-t(i))^3*fpp(t(i),y(i));
        y(i+1) = y(i+1) +(1/24)*(t(i+1)-t(i))^4*f3(t(i),y(i));
        y(i+1) = y(i+1) +(1/120)*(t(i+1)-t(i))^5*f4(t(i),y(i));
        y(i+1) = y(i+1) +(1/720)*(t(i+1)-t(i))^6*f5(t(i),y(i));
    end
end
