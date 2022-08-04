function dy = SHM_ODE45_function(t,y)
y1 = y(1);
v = y(2);

dy1 = v;
dy2 = -y1;

dy = [dy1;dy2];