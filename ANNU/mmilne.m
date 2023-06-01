function [t,x]=mmilne(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
pasos = 4;
intervalo2 = [t(1), t(pasos)];
[~,x] = mrk3(f,intervalo2,x0,pasos-1);
x = x.';
for i =1:pasos-1
    y(:,i+1) = f(t(i+1),x(:,i+1));
end
for i=1:N-3
    y(:,1) = y(:,2);
    y(:,2) = y(:,3);
    y(:,3) = y(:,4);
    y(:,4) = f(t(i+3),x(:,i+3));
    x(:,i+4) = x(:,i)+4*h/3*(2*y(:,4)-y(:,3)+2*y(:,2));
end
t=t(:);
x= x.';
end

