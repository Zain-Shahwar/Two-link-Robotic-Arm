clc
% Two Link Robotic Arm
% DH (Denavit–Hartenberg) Table
%           theta   d      a       alpha    R/P   offset

L(1) = Link([0      0      0.20       0      0      0]);
L(2) = Link([0      0      0.15       0      0      0]);
% Build a serial robot object
R2 = SerialLink(L(1:2), 'name', 'TwoLink');

% Robot base coordinates (cartesian space)
R2.base=transl(0,0,0);

% Desired points in cartesian space (meters) 
% p0 = [0.05 0.4 0];
% p1 = transl(-0.2,0.2,0);
% p2 = transl(0.3,0.02,0)
% p3 = transl(-.15,-0.2,0)
% p4 = transl(-0.2,0.2,0);
% p5 = transl(0.3,0.380,0);
 
hold on
view(-0.6,0.8);
xlim([-0.6,1]);
ylim([-0.6,1]); 
zlim([-0.1,0.2]); 

pp1 = transl(-0.2,0.2,0);
pp2 = transl(0.2,0.2,0);
crt_sp1 = ctraj(pp1,pp2,50);
crt_ik1  = R2.ikine(crt_sp1,'mask',[1 1 0 0 0 0]);
% R2.plot(crt_ik1)

pp2 = transl(0.2,0.2,0);
pp3 = transl(0.2,-0.2,0);
crt_sp2 = ctraj(pp2,pp3,50);
crt_ik2  = R2.ikine(crt_sp2,'mask',[1 1 0 0 0 0]);

pp4 = transl(-0.2,-0.2,0);
crt_sp3 = ctraj(pp3,pp4,50);
crt_ik3  = R2.ikine(crt_sp3,'mask',[1 1 0 0 0 0]);

pp5 = transl(-0.2,0.2,0);
crt_sp4 = ctraj(pp4,pp5,50);
crt_ik4  = R2.ikine(crt_sp4,'mask',[1 1 0 0 0 0]);

for i=1:1:50
    fd1=R2.fkine(crt_ik1(i,:));
     j = transpose(fd1.t);
%     k(i,:)= j;
    plot2(j,'r.')    ;
     R2.plot(crt_ik1(i,:)) ;
end
for i=1:1:50
    fd2=R2.fkine(crt_ik2(i,:));
     j = transpose(fd2.t);
%     k(i,:)= j;
    plot2(j,'r.')    ;
     R2.plot(crt_ik2(i,:)) ;
end
for i=1:1:50
    fd3=R2.fkine(crt_ik3(i,:));
     j = transpose(fd3.t);
%     k(i,:)= j;
    plot2(j,'r.')    ;
     R2.plot(crt_ik3(i,:)) ;
end

for i=1:1:50
    fd4=R2.fkine(crt_ik4(i,:));
     j = transpose(fd4.t);
%     k(i,:)= j;
    plot2(j,'r.')    ;
     R2.plot(crt_ik4(i,:)) ;
end
% 
% % % 
% Robot Dynmaics
% % mass of links
% L(1).m=0.2;
% L(2).m=0.15;
% 
% % Center of mass
% L(1).r=[-0.1 0 0];
% L(2).r=[-0.075 0 0];
% 
% % Intertia 
% L(1).I=zeros(3,3);
% L(2).I=zeros(3,3);
% 
% 
% % pp4 = transl(-0.2,-0.2,0);


% hold on
% R2.plot(crt_ik1)
% R2.plot(crt_ik2)
% R2.plot(crt_ik3)
% R2.plot(crt_ik4)

% p1 = transl(0.1,0.02,0);
% p2 = transl(0.2,0.02,0);
% p3 = transl(0.2,0.2,0);
% p4 = transl(0.1,0.2,0);
% p5 = transl(0.1,0.02,0);

%  p0 = [0.05 0.4 0];
%  p1 = transl(0.2,-0.1,0);
%  p2 = transl(0.2,-0.2,0);
%  p3 = transl(0.38,0.32,0);
%  p4 = transl(0.020,0.380,0);
%  p5 = transl(0.380,0.380,0);


% 
% % Plot the desired points
% hold on 
% %  start_point = p0;
% %  plot2(start_point,'*') 
%  
%  point1 = p1';
%  s1 = point1(4,1:3);
%  plot2(s1,'r.') 
%  
%  point2 = p2';
%  s2 = point2(4,1:3);
%  plot2(s2,'r.')
%  
%  point3 = p3';
%  s3 = point3(4,1:3);
%  plot2(s3,'r.') 
%  
%  point4 = p4';
%  s4 = point4(4,1:3);
%  plot2(s4,'r.') 
%  
%  point5 = p5';
%  s5 = point5(4,1:3);
%  plot2(s5,'r.')
%  plot2(s5,'*')
% 
% % performing inverse kinematics
% q0 = [-0.6202    2.6226]
% q1 = R2.ikine(p1,'mask',[1 1 0 0 0 0])
% q2 = R2.ikine(p2,'mask',[1 1 0 0 0 0])
% q3 = R2.ikine(p3,'mask',[1 1 0 0 0 0])
% q4 = R2.ikine(p4,'mask',[1 1 0 0 0 0])
% % q5 = R2.ikine(p5,'mask',[1 1 0 0 0 0])
% 
% % 
% p = [q0; q1; q2; q3; q4]*180/pi

% a = p(1,1);
% b = p(2,1);
% c = p(3,1);
% d = p(4,1);
% e = p(5,1);
% 
% a1 = p(1,2);
% b1 = p(2,2);
% c1 = p(3,2);
% d1 = p(4,2);
% e1 = p(5,2);
% 
% if (a<0)
%     a = -a;
% end
% 
% if (b<0)
%     b = -b;
% end
% 
% if (c<0)
%     c = -c;
% end
% 
% if (d<0)
%     d = -d;
% end
% 
% if (e<0)
%     e = -e;
% end
% 
% if (a1<0)
%     a1 = -a1;
% end
% 
% if (b1<0)
%     b1 = -b1;
% end
% 
% if (c1<0)
%     c1 = -c1;
% end
% 
% if (d1<0)
%     d1 = -d1;
% end
% 
% if (e1<0)
%     e1 = -e1;
% end
% % 
% % 
% % 
% theta1 = a
% theta2 = b
% theta3 = c
% theta4 = d
% theta5 = e
% 
% theta1a = a1
% theta2a = b1
% theta3a = c1
% theta4a = d1
% theta5a = e1
% 
% qq1 = [theta1 theta1a]
% qq2 = [theta2 theta2a]

% l1 = 0.20;
% l2 = 0.15;
% 
% x = 0.2;
% y = 0.08;
% q22 = acos((x^2+y^2-l1^2-l2^2)/(2*l1*l2))
% q11 = atan(y/x) - atan(l2*sin(q22))/(l1+(l2*cos(q22)))


% c = ctraj(p1,p2,10);
% traj0=jtraj(q1,q2,10);

% %
% % % Time vector & steps
t=0:.03:2;   
traj0=jtraj(q0,q1,t);
traj1=jtraj(q1,q2,t);
traj2=jtraj(q2,q3,t); 
traj3=jtraj(q3,q4,t);
traj4=jtraj(q4,q0,t);
% traj5=jtraj(q5,q0,t);

% t1 = 0:1:10;
% traj6 = jtraj(q0,q1,t1);
% tt = traj6(:,2)*(180/pi)
% 
% traj6 = jtraj(q1,q2,t1);
% tt1 = traj6(:,2)*(180/pi)
% 
% traj6 = jtraj(q2,q0,t1);
% tt2 = traj6(:,2)*(180/pi)
% 
% f = tpoly(p(1,2),p(5,2),50)


% 
% traj7 = jtraj(d1,a1,t1);
% % traj5=jtraj(q5,q0,t);
% % 
% % performing Forward kinematics and Simulation

% for i=1:1:67 
%     fd0=R2.fkine(traj0(i,:));
%     j = transpose(fd0.t);
%     k(i,:)= j;
%     plot2(j,'r.')    
%     R2.plot(traj0(i,:));
% end
% 
% for i=1:1:67 
%     fd1=R2.fkine(traj1(i,:));
%     j = transpose(fd1.t);
%     k(i,:)= j;
%     plot2(j,'r.')    
%     R2.plot(traj1(i,:)) 
% end
% 
% for i=1:1:67 
%     fd2=R2.fkine(traj2(i,:));
%     j = transpose(fd2.t);
%     k(i,:)= j;
%     plot2(j,'r.')    
%     R2.plot(traj2(i,:)) 
% end
% % 
% for i=1:1:67 
%     fd3=R2.fkine(traj3(i,:));
%     j = transpose(fd3.t);
%     k(i,:)= j;
%     plot2(j,'r.')    
%     R2.plot(traj3(i,:)) 
% end
% % 
% for i=1:1:67 
%     fd4=R2.fkine(traj4(i,:));
%     j = transpose(fd4.t);
%     k(i,:)= j;
%     plot2(j,'r.')    
%     R2.plot(traj4(i,:)) 
% end
% for i=1:1:67 
%     fd5=R2.fkine(traj5(i,:));
%     j = transpose(fd5.t);
%     k(i,:)= j;
%     plot2(j,'r.')    
%     R2.plot(traj5(i,:)) 
% end
% % 
% 
% 
% 
% %   % %define dynamic mass
% % L(1).m=0.0045;
% % L(2).m=0.0025;
% % 
% % %Inertia tensor definition
% % 
% % 	L(1).I = [0.00024    0        0;
% % 	       0          0.00042  0;
% %            0	       0	   0.0004252];
% % 	L(2).I = [0.00024    0        0;
% % 	          0          0.00042  0;
% %               0	         0	      0.0004252];
% % 
% % % CG definition
% % L(1).r=[0.09;0;0];
% % L(2).r=[0.4;0;0];
