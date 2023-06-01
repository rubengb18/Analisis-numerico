alpha=0.11; beta=1; T=150; f=@(t,x) [x(2);-x(1)-alpha*(x(1)^2-beta)*x(2)], x0=[0.1,0.1], intervalo=[0,T]; N=1000
tol = 10^-5    
opciones=odeset('Stats','off','AbsTol',tol,'RelTol',tol)
[t1,x1]=ode45(f,intervalo, x0, opciones);

c=size(x1,2); % Numero de columnas de la matriz x1
color=['r','g','b'];
figure(1)
for i=1:c
    subplot(c,1,i)
    hold on
    plot(t1,x1(:,i),color(i))
    s=sprintf('Coordenada %d de la solucion',i);
    title(s)
end


[t2,x2] = ode15s(f,intervalo,x0,opciones);
c=size(x2,2); % Numero de columnas de la matriz x2
color=['r','g','b'];
figure(2)
for i=1:c
    subplot(c,1,i)
    hold on
    plot(t2,x2(:,i),color(i))
    s=sprintf('Coordenada %d de la solucion',i);
    title(s)
end

%Apartado a) V
v1=diff(t1)
v1= v1.';
v_1=[1:length(t1)-1]

v2=diff(t2)
v2= v2.';
v_2=[1:length(t2)-1]

figure(3)
plot(v_1,v1,color(2))
figure(4)
plot(v_2,v2,color(1))