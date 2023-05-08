%Use Eulers Method to solve initial value problem (order 2)  

function y=euler2(t,fp,alpha)
% y'=f(t,y)
% y(t(1))= alpha
    y(1)= alpha;
    for i=1:length(t)-1
        % y(ti+1) = y(ti)+ hf(ti, y(ti))
        y(i+1) = y(i)+ (t(i+1)-t(i))*fp(t(i),y(i));
        y(i+1) = y(i+1) +0.5*(t(i+1)-t(i))^2*fp(t(i),y(i));
    end
    
end 
