%  Householder method to form a tridiagonal matrix from A.
function Anew = householder(A)

lngth = length(A);  
v = zeros(lngth,1);  
I = eye(lngth);  
Aold = A;  

for jj=1:lngth-2  
    v(1:jj) = 0;
    S = ss(Aold,jj);
    v(jj+1) = sqrt(.5*(1+abs(Aold(jj+1,jj))/(S+2*eps)));
    v(jj+2:lngth) = Aold(jj+2:lngth,jj)*sign(Aold(jj+1,jj))...
                   /(2*v(jj+1)*S+2*eps);
    P = I-2*v*v';
    Anew = P*Aold*P;
    Aold = Anew;
end

Anew(abs(Anew(:))<5e-14)=0; % Tolerence.


function anss = ss(A,jj)
anss = sqrt(sum(A(jj+1:end,jj).^2));
