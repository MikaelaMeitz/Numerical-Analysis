%LU factorization
function [L,U,info] = MeLU(A,TOL)
% A is n by n 
% A= LU
% tol = 10^8
%info = 0: got the LU, otherwise =1
[n,m] = size(A);
L = zeros(n);
U = zeros(n); 
 for I = 1:n
     L(I,I) =1; 
 End
info = 0;

 %Step 1 
U(1,1)=A(1,1);
if abs (U(1,1))<TOL
    info = 1;
    exit
end

%Step 2
for J = 2:n
    U(1,J) = A(1,J)/L(1,1);
    L(J,1) = A(J,1)/U(1,1);
end

%Step 3
for I = 2:n-1    

    %Step4
    U(I,I) = A(I,I);
    for K = 1:I-1 
        U(I,I)=U(I,I)-L(I,K)*U(K,I);
    end
    if abs(U(I,I))<TOL
        info =1;
        exit
    end

    %Step 5
    for J = I+1:n 
        U(I,J) = A(I,J); 
        L(J,I) = A(J,I);
        for K=1:I-1
            U(I,J)= U(I,J) - L(I,K)*U(K,J);
            L(J,I) =L(J,I) -L(J,K)*U(K,I);
        end
        U(I,J) = U(I,J)/L(I,I);
        L(J,I) = L(J,I)/U(I,I);
    end
end

%Step 6
U(n,n)= A(n,n);
    for K = 1:n-1
        U(n,n) = U(n,n) - L(n,K)*U(K,n);
    end
    if abs(U(n,n)) < TOL 
        info = 1; 
        exit
    end
end
