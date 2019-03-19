clc
m1= 1; m2= 1;
c1= 0.1; c2= 0.07;
a1= 0.2; a2= 0.15;
g= 9.81;
q1=1; q2=2;
q1d=1; q2d=1;
q1dd=1; q2dd=1;

Tau = [ m1*(a1 + c1)*(a1*q1dd + c1*q1dd + g*cos(q1)) + m2*(a2 + c2)*(a2*(q1dd + q2dd) + c2*(q1dd + q2dd) + cos(q2)*(a1*q1dd + g*cos(q1)) + sin(q2)*(a1*q1d^2 - g*sin(q1))) - a1*m2*sin(q2)*(a2*(q1d + q2d)^2 + c2*(q1d + q2d)^2 - sin(q2)*(a1*q1dd + g*cos(q1)) + cos(q2)*(a1*q1d^2 - g*sin(q1))) + a1*m2*cos(q2)*(a2*(q1dd + q2dd) + c2*(q1dd + q2dd) + cos(q2)*(a1*q1dd + g*cos(q1)) + sin(q2)*(a1*q1d^2 - g*sin(q1))); 
        m2*(a2 + c2)*(a2*(q1dd + q2dd) + c2*(q1dd + q2dd) + cos(q2)*(a1*q1dd + g*cos(q1)) + sin(q2)*(a1*q1d^2 - g*sin(q1)))]'
% 
% tau1= Tau(1,1)
% tau2= Tau(1,2)

inertia = [ m1*(a1 + c1)^2 + m2*(a2 + c2)*(a2 + c2 + a1*cos(q2)) + a1^2*m2*sin(q2)^2 + a1*m2*cos(q2)*(a2 + c2 + a1*cos(q2)), m2*(a2 + c2)*(a2 + c2 + a1*cos(q2));
                                                                        m2*(a2 + c2)^2 + a1*m2*cos(q2)*(a2 + c2),                      m2*(a2 + c2)^2]
inv_inertia = inv(inertia)

iner_tau = inertia*[q1dd;q2dd]
% inv_inertia1 = inv_inertia(:,1)
        
cor1 =[ -a1*m2*q2d*sin(q2)*(a2 + c2), -a1*m2*sin(q2)*(a2 + c2)*(q1d + q2d);
        a1*m2*q1d*sin(q2)*(a2 + c2),                                   0]

cor = cor1*[q1d;q2d]
cc = cor'
    
% cora = cor1(1,:)'
% corb = cor1(2,:)'
        
grav = [ g*(a1*m1*cos(q1) + a1*m2*cos(q1) + c1*m1*cos(q1) + a2*m2*cos(q1 + q2) + c2*m2*cos(q1 + q2)), g*m2*cos(q1 + q2)*(a2 + c2)]
 
a = Tau-cc-grav
q_acc = iner_tau*a
% qdd = q_acc(:,1)