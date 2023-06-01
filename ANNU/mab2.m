function [t,x]=mab2(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
pasos = 2;
intervalo2 = [t(1), t(pasos)];
[~,x] = meuler(f,intervalo2,x0,pasos-1);
x = x.';
for i =1:pasos-1
    y(:,i+1) = f(t(i),x(:,i));
end
for i=1:N-1
    y(:,1) = y(:,2);
    y(:,2) = f(t(i+1),x(:,i+1));
    x(:,i+2) = x(:,i+1)+h/2*(3*y(:,2)-y(:,1));
end
t=t(:);
x= x.';
end