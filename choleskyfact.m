%cholesky factorization 

function [L]= choleskyfact(A)
[n] = size (A,1);
%Step 1
L(1,1) =sqrt(A(1,1));
%Step 2
for J = 2:n 
    L(J,1)= A(J,1)/L(1,1); 
end
%Step 3
for I = 1:n-1
    %Step 4 
    L(I,I) = A(I,I);
    for K = 1:I-1
        L(I,I)= L(I,I) -L(I,K)^2; 
    end
    L(I,I)= sqrt(L(I,I));
    %Step 5
    for J= I+1:n 
        L(J,I) = A(J,I); 
        for K = 1:I-1
             L(J,I)= L(J,I) -L(J,K)*L(I,K);
        end
        L(J,I) = L(J,I)/L(I,I);
    end
end
%Step 6
L(n,n) = A(n,n); 
for K = 1:n-1
    L(n,n) = L(n,n) -L(n,K).^2;
end
L(n,n) = sqrt (L(n,n)); 
end
