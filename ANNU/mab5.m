function [t,x]=mab5(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
pasos = 5;
intervalo2 = [t(1), t(pasos)];
[~,x] = mrk4(f,intervalo2,x0,pasos-1);
x = x.';
for i =1:pasos-1
    y(:,i+1) = f(t(i+1),x(:,i+1));
end
for i=1:N-4
    y(:,1) = y(:,2);
    y(:,2) = y(:,3);
    y(:,3) = y(:,4);
    y(:,4) = y(:,5);
    y(:,5) = f(t(i+4),x(:,i+4));
    x(:,i+5) = x(:,i+4)+h/720*(1901*y(:,5)-2774*y(:,4)+2616*y(:,3)-1274*y(:,2)+251*y(:,1));
end
t=t(:);
x= x.';
end

