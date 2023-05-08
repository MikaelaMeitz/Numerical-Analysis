%PA-LU factorization of a matrix A
function [p l u]=palu(a)
size_a=size(a);
p=eye(size_a(1));
u=a;
for nc=1:size_a(1)
    %check for pivot=0 
    if u(nc,nc)==0
        %find a row that works
        for nr_tmp=nc+1:size_a(1)
            if u(nr_tmp,nc)~=0 
                found=1;
                nr=nr_tmp;
            end
        end
        if found==1
         %swap rows P, L, and U
            temp=p(nc,:);
            p(nc,:)=p(nr,:);
            p(nr,:)=temp;
            temp=l(nc,:);
            l(nc,:)=l(nr,:);
            l(nr,:)=temp;
            temp=u(nc,:);
             u(nc,:)=u(nr,:);
            u(nr,:)=temp;
        end
    end
    %set diagonal element to 1
    l(nc,nc)=1;
    for nr=nc+1:size_a(1)
        l(nr,nc)=u(nr,nc)/u(nc,nc);
        u(nr,:)=u(nr,:)-l(nr,nc)*u(nc,:);
    end
end
