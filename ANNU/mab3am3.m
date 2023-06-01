function [t,x]=mab3am3(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
pasos = 3;
intervalo2 = [t(1), t(pasos)];
[~,x] = mrk3(f,intervalo2,x0,pasos-1);
x = x.';

%PREDICCION con Adamas-Basford de 3 pasos
for i =1:pasos-1
    y(:,i+1) = f(t(i),x(:,i));
end
for i=1:N-2
    y(:,1) = y(:,2);
    y(:,2) =  y(:,3);
    y(:,3) = f(t(i+2),x(:,i+2));
    x(:,i+3) = x(:,i+2)+h/12*(23*y(:,3)-16*y(:,2)+5*y(:,1));
    %EVALUACION
    y(:,pasos+1) = f(t(i+pasos),x(:,i+pasos));
    %CORRECCION con Adams–Moulton de 3 pasos
    x(:,i+3) = x(:,i+2)+h/24*(9*y(:,4)+19*y(:,3)-5*y(:,2)+y(:,1)); 
end

t=t(:);
x= x.';
end

