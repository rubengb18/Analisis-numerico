u=50; f=@(t,x) -u*(x-cos(t)); intervalo=[0,1]; N=24;
g=@(t) u^2/(1+u^2)*(cos(t)-exp(-u*t)+1/u*sin(t));
h = 1/N;
t = 0:h:1;
x(1)=0;
%Metodo de Euler implicito
for i=1:N
    x(i+1) = (1/(h*u+1))*(x(i)+h*u*cos(t(i+1)));
end
t=t(:);
x= x.';

figure(1)
hold on
plot(t,x,'r')

N=26;
h = 1/N;
t = 0:h:1;
x_2(1)=0;
%Metodo de Euler implicito
for i=1:N
    x_2(i+1) = (1/(h*u+1))*(x_2(i)+h*u*cos(t(i+1)));
end
t=t(:);
x_2= x_2.';
hold on
plot(t,x_2,'b')

t = 0:1/1000:1;
plot(t, g(t),'g')
legend('N=24','N=26', 'Solucion Exacta')