% Examen Julio 2019

f= @(t,x) [x(2); x(2)+2*x(1)-4*t];
x0 = [0,4];
N = 100;
h = 1/N;
intervalo = [0, 1];
t = intervalo(1):h:intervalo(2);
solexac = @(t) 2*t -1 +exp(2*t);

% Inicialización
x(:,1) = x0;
fi = f(t(1), x(:,1));

for i=1:N
   % P
   x(:,i+1) = x(:,i) + h*fi;
   % E
   fi1 = f(t(i+1), x(:,i+1));
   % C
   x(:,i+1) = x(:,i) + h*(fi1 + fi)/2;
   % E
   fi = f(t(i+1), x(:,i+1));
end

x2 = solexac(t);

figure(1);
plot(t,x(1,:), 'r');
hold on
plot(t,x2, 'b');
title('Solución numérica vs exacta');
legend('Solución numérica','Solución exacta');

max(abs(x(1,:)-x2))