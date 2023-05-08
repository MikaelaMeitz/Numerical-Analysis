%Gaussian Elimination, basic way 
% i row, j col
function [x] = GaussianElim(A,b)
tic
[n,~] = size(A); 
x = zeros(n,1); 
for i=1: n-1
    m = A(i+1:n,i)/A(i,i);
    A(i+1:n,:)=A(i+1:n,:)-m*A(i,:);
    b(i+1:n,:)=b(i+1:n,:)-m*b(i,:);
end
x(n,:)=b(n,:)/A(n,n);
for i=n-1:-1:1
    x(i,:)=(b(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end 
toc