function [t,x]=mpuntomedio(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);
x = zeros(size(x0, 2), N);
x(:,1) = x0(:);
x(:,2) = x0(:) + h* f(t(1), x0(:));
for i=1:N-1
    x(:,i+2) = x(:, i) + 2*h*f(t(i+1), x(:, i+1));
end
t = t(:);
x = x.';