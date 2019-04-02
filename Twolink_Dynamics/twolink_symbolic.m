clc
syms q1 q2 q1d q2d q1dd q2dd
syms a1 a2 g
syms c1 c2 m1 m2  
syms Ixx1 Ixx2 Iyy1 Iyy2 Izz1 Izz2 b1 b2
Iyy1 = 0;
Iyy2 = 0;
b1 = 0;
b2 = 0;

twolink = SerialLink([
    Revolute('d', 0, 'a', a1, 'alpha', 0, 'm', m1, 'r', [c1 0 0], 'I', [0 Iyy1 0], 'B', 1.48e-3, 'G', 1, 'Jm', 200e-6, 'standard')
    Revolute('d', 0, 'a', a2, 'alpha', 0, 'm', m2, 'r', [c2 0 0], 'I', [0 Iyy2 0], 'B', 1.48e-3, 'G', 1, 'Jm', 200e-6, 'standard')
    ], ...
    'name', 'R2', ...
    'comment', 'from Spong, Hutchinson, Vidyasagar')
% twolink = twolink.sym();
% twolink.gravity = [0; 0; g];
% twolink.base = trotx(sym('pi')/2);
tau = twolink.rne([q1 q2],[q1d q2d],[q1dd q2dd])

% FK = twolink.fkine([q1 q2])
% inertia = twolink.inertia([q1 q2]);
% cor = twolink.coriolis([q1 q2],[q1d q2d]);
% grav = twolink.gravload([q1 q2]);
% fric = twolink.friction([q1d q2d])
% twolink.rne([q1 q2],[q1d q2d],[q1dd q2dd])
% % twolink.inertia([q1 q2])
% twolink.dyn
% cg = CodeGenerator(twolink);
% cg.geneverything();
% L(1) = Link([0 0 0.20 0 0 0]);
% L(2) = Link([0 0 0.15 0 0 0]);
% % % %define dynamic mass
% L(1).m=1;
% L(2).m=1;
% 
% % % %CG definition
% L(1).r=[0.1,0,0];
% L(2).r=[0.075,0,0];
% 
% % % %Inertia tensor definition
%  L(1).I=eye(3,3);
%  L(2).I=eye(3,3);
% 
% % % %Coulomb Friction
% L(1).Tc=15;
% L(2).Tc=8;
% % 
% % % %Viscous Friction
% L(1).B=2;
% L(2).B=6;
% 
% % % Build a serial robot object
% R2 = SerialLink(L(1:2), 'name', 'RR')
% R2.dyn
% 
% R2.inertia([0 0])