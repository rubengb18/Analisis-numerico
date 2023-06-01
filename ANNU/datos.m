
f=@(t,x) [x(2);-9*x(1)+8*sin(t)]; intervalo=[0,2*pi]; x0=[0,4]; N=1000;

%Oscilador armónico
%k=1; m=1; f=@(t,x) [x(2);-(k/m)*x(1)]; intervalo=[0,10]; x0=[1,0]; N=1000; 
%solexac=@(t) [cos(t), -sin(t)];

%Van der Pol
%%a = 1; b = 2; T = 10; x1 = 0.1; x2 = 0.2; f = @(t,x) [x(2); -a*(x(1)^2-b)*x(2) - x(1)]

%f=@(t,x) [];