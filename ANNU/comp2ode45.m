function comp2ode45(met)
datos;
[t,x1] = met(f,intervalo,x0,N);
[~,x2] = ode45(f,t,x0,N);
graficas2;