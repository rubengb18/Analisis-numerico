function [t,x]=mab4am4(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
pasos = 4;
intervalo2 = [t(1), t(pasos)];
[~,x] = mrk4(f,intervalo2,x0,pasos-1);
x = x.';

%PREDICCION con Adamas-Basford de 3 pasos
for i =1:pasos-1
    y(:,i+1) = f(t(i),x(:,i));
end
for i=1:N-3
    y(:,1) = y(:,2);
    y(:,2) = y(:,3);
    y(:,3) = y(:,4);
    y(:,4) = f(t(i+3),x(:,i+3));
    x(:,i+4) = x(:,i+3)+h/24*(55*y(:,4)-59*y(:,3)+37*y(:,2)-9*y(:,1));
    %EVALUACION
    y(:,pasos+1) = f(t(i+pasos),x(:,i+pasos));
    %CORRECCION con Adams–Moulton de 4 pasos
    x(:,i+4) = x(:,i+3)+h/720*(251*y(:,5)+646*y(:,4)-264*y(:,3)+106*y(:,2)-19*y(:,1)); 
end

t=t(:);
x= x.';
end

