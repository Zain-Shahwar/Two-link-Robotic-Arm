
m1= 1; m2= 1;
c1= 0.1; c2= 0.07;
a1= 0.2; a2= 0.15;
g= 9.81;
q1=0; q2=0;
q1d=0; q2d=0;
q1dd=0; q2dd=0;

Tau = [ m1*(a1 + c1)*(a1*q1dd + c1*q1dd + g*cos(q1)) + m2*(a2 + c2)*(a2*(q1dd + q2dd) + c2*(q1dd + q2dd) + cos(q2)*(a1*q1dd + g*cos(q1)) + sin(q2)*(a1*q1d^2 - g*sin(q1))) - a1*m2*sin(q2)*(a2*(q1d + q2d)^2 + c2*(q1d + q2d)^2 - sin(q2)*(a1*q1dd + g*cos(q1)) + cos(q2)*(a1*q1d^2 - g*sin(q1))) + a1*m2*cos(q2)*(a2*(q1dd + q2dd) + c2*(q1dd + q2dd) + cos(q2)*(a1*q1dd + g*cos(q1)) + sin(q2)*(a1*q1d^2 - g*sin(q1))), m2*(a2 + c2)*(a2*(q1dd + q2dd) + c2*(q1dd + q2dd) + cos(q2)*(a1*q1dd + g*cos(q1)) + sin(q2)*(a1*q1d^2 - g*sin(q1)))]

tau1= Tau(1,1)
tau2= Tau(1,2)