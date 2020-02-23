%  Kuramoto function

function f=kuramoto(x,K,N,Omega)

f=Omega+(K/N)*sum(sin(x*ones(1,N)-(ones(N,1)*x')))';


end