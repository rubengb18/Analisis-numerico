colx=size(x1,2); % Numero de columnas de la matriz x
color=['r','b','g'];
figure(1)
for i=1:colx
    subplot(colx,1,i)
    plot(t,x1(:,i),color(1))
    hold on
    plot(t,x2(:,i),color(2))
    s=sprintf('Coordenada %d de las soluciones',i);
    title(s)
end
if colx>1
    pause(3)
    figure(2)
    if colx==2
        plot(x1(:,1),x1(:,2),color(1))
        hold on
        plot(x2(:,1),x2(:,2),color(2))
    else
        plot3(x1(:,1),x1(:,2),x1(:,3),color(1))
        hold on
        plot3(x2(:,1),x2(:,2),x2(:,3),color(2))

    end
    title('Trayectorias de las soluciones')
end
pause(3)
figure(3)
x = abs(x1 - x2);
max(x(:))
for i=1:colx 
    subplot(colx,1,i)
    plot(t,x(:,i),color(3))
    s=sprintf('Diferencia en la coordenada %d',i);
    title(s)
end