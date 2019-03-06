% clc
% Two Link Robotic Arm
% DH (Denavit–Hartenberg) Table
mdl_twolink
twolink.sym()
syms q1 q2 qd1 qd2 qdd1 qdd2 b1 b2 m1 m2 c1 c2
L(1).m1=m1;
L(2).m2=m2;

% Center of mass
% L(1).r=[-0.1 0 0];
% L(2).r=[-0.075 0 0];

L(1).r=c1;
L(2).r=c2;

% Intertia 
L(1).I=zeros(3,3);
L(2).I=zeros(3,3);

M=twolink.inertia([q1 q2])


% tau = twolink.rne([q1 q2], [qd1 qd2], [qdd1 qdd2])

% alpha1=pi/2;
% alpha2=0;
% d2=0;
% a1=0.25;
% d1=0.45;
% a2=0.5;
% 
% L(1) = Link([0 d1 a1 alpha1]);
% L(2) = Link([0 d2 a2 alpha2]);
% IR = SerialLink(L, 'name', 'IR');
% 
% syms I1xx I1yy I1zz I1xy I1xz I1yz m1 x1 y1 z1 I2xx I2yy I2zz I2xy I2xz I2yz m2 x2 y2 z2
% 
% IR.links(1).m = m1;
% IR.links(1).r = [x1 y1 z1];
% IR.links(1).I = [I1xx I1xy I1xz; I1xy I1yy I1yz; I1xz I1yz I1zz];
% 
% 
% IR.links(2).m = m2;
% IR.links(2).r = [x2 y2 z2];
% IR.links(2).I = [I2xx I2xy I2xz; I2xy I2yy I2yz; I2xz I2yz I2zz];
% 
% cGen = CodeGenerator(IR)
% cGen.geneverything();