u=50; f=@(t,x) -u*(x-cos(t)); intervalo=[0,1]; x0=[0]; N=24;
g=@(t) u^2/(1+u^2)*(cos(t)-exp(-u*t)+1/u*sin(t));
[t,x]=meuler(f,intervalo,x0,24);
figure(1)
hold on
plot(t,x,'r')
[t,x]=meuler(f,intervalo,x0,26);
plot(t,x, 'b')
x = g(t);
plot(t,x,'g')
legend('N=24','N=26', 'Solucion Exacta')