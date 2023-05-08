%create Hermite polynomial 

function pout = hermite (x,f,fp)
pout=0;
for j=1 : length (x) 
    lin = zeros (1, length (x));
    lin(j) = 1; % set lin to [0 0 ... 0 1]
    l = lagrange (x, lin); % get L_n,j
    lsq = conv (l,l) ; % L_n squared 
    lnjp = polyval (polyder (l), x(j)); % L_n,j'(x_j)
    Hnj = conv (([0 1] -2*lnjp*[1 -x(j)]), lsq); 
    Hnjh= conv ([1 -x(j)] , lsq); 
    pout = pout +f(j)*Hnj + fp(j)*Hnjh; 
end 
end 
