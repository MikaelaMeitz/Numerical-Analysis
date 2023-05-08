%Use Eulers Method to solve initial value problem 

function y=euler(t,f,alpha)
% y'=f(t,y)
% y(t(1))= alpha
    y(1)= alpha;
    for i=1:length(t)-1
        % y(ti+1) = y(ti)+ hf(ti, y(ti))
        y(i+1) = y(i)+ (t(i+1)-t(i))*f(t(i),y(i));
    end
    
end 
