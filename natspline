% calculates natural cubic spline
% inputs x and f are 1 by n+1
% output is 4 by n

function pout = natspline(x,f)
    n = length(x) - 1;
    h = x(2:n+1)-x(1:n);
    a=f;
   
    % construct A
    A = zeros(n+1); % (n+1) by (n+1)
    A(1,1) = 1;
    A(n+1,n+1) = 1;
    for i = 2:n
        A(i,i-1) = h(i-1);
        A(i,i) = 2*(h(i-1)+h(i));
        A(i,i+1) = h(i);
    end

    % construct b
    b(1) = 0;
    b(n+1) = 0;
    b(2:n) = 3*(a(3:n+1)-a(2:n))./h(2:n) - 3*(a(2:n)-a(1:n-1))./h(1:n-1);

    c = linsolve(A,b')';
    pout(3,:) = c(1:n);
    pout(1,:) = f(1:n);
    pout(2,:) = (a(2:n+1)-a(1:n))./h - h.*(2*c(1:n)+c(2:n+1))/3;
    pout(4,:) = (c(2:n+1)-c(1:n))./(3*h);
end

