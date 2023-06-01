function [t,x]=mab2am2(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
pasos = 2;
intervalo2 = [t(1), t(pasos)];
[~,x] = meulermej(f,intervalo2,x0,pasos-1);
x = x.';

%PREDICCION con Adamas-Basford de 2 pasos
for i =1:pasos-1
    y(:,i+1) = f(t(i),x(:,i));
end
for i=1:N-1
    y(:,1) = y(:,2);
    y(:,2) = f(t(i+1),x(:,i+1));
    x(:,i+2) = x(:,i+1)+h/2*(3*y(:,2)-y(:,1));
    %EVALUACION
    y(:,pasos+1) = f(t(i+pasos),x(:,i+pasos));
    %CORRECCION con Adams–Moulton de 2 pasos
    x(:,i+2) = x(:,i+1)+h/12*(5*y(:,3)+8*y(:,2)-y(:,1)); 
end

t=t(:);
x= x.';
end

