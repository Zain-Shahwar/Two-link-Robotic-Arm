clc
% Two Link Robotic Arm
% DH (Denavit–Hartenberg) Table
%           theta   d      a       alpha    R/P   offset
% 
% L(1) = Link([0      0      0.20       0      0      0]);
% L(2) = Link([0      0      0.15       0      0      0]);
% % Build a serial robot object
% twolink = SerialLink(L(1:2), 'name', 'RR');


m1= 0.5; m2= 0.3;
c1= 0.1; c2= 0.07;
a1= 0.2; a2= 0.15;
g= 9.81;
twolink = SerialLink([
    Revolute('d', 0, 'a', a1, 'alpha', 0, 'm', m1, 'r', [c1 0 0], 'I', [0 0 0], 'B', 1.48e-10, 'G', 1, 'Jm', 200e-10, 'standard')
    Revolute('d', 0, 'a', a2, 'alpha', 0, 'm', m2, 'r', [c2 0 0], 'I', [0 0 0], 'B', 1.48e-10, 'G', 1, 'Jm', 200e-10, 'standard')
    ], ...
    'name', 'R2', ...
    'comment', 'from Spong, Hutchinson, Vidyasagar')
% 
twolink.fkine([pi/4 pi/2])
twolink.plot([pi/4 pi/2])


% Robot base coordinates (cartesian space)
twolink.base=transl(0,0,0);
% twolink.plot([0 0])
% hold on
% view(-0.6,0.8);
% xlim([-0.6,1]);
% ylim([-0.6,1]); 
% zlim([-0.1,0.2]); 
% 
% %Set number of poitts from 1 point to another
% po = 25;
% 
% % Desired points in cartesian space (meters)
% % % ##########Plotting ZAIN#############
% 
% %Point 1 to 2 
% pp1 = transl(-0.2,0.2,0);
% pp2 = transl(-0.1,0.2,0);
% crt_sp1 = ctraj(pp1,pp2,po);
% crt_ik1  = R2.ikine(crt_sp1,'mask',[1 1 0 0 0 0]);
% 
% %Point 2 to 3
% pp3 = transl(-0.2,0.1,0);
% crt_sp2 = ctraj(pp2,pp3,po);
% crt_ik2  = R2.ikine(crt_sp2,'mask',[1 1 0 0 0 0]);
% 
% %Point 3 to 4
% pp4 = transl(-0.1,0.1,0);
% crt_sp3 = ctraj(pp3,pp4,po);
% crt_ik3  = R2.ikine(crt_sp3,'mask',[1 1 0 0 0 0]);
% 
% % Point 4 to 5
% pp5 = transl(0,0.2,0);
% crt_sp4 = ctraj(pp4,pp5,po);
% crt_ik4  = R2.ikine(crt_sp4,'mask',[1 1 0 0 0 0]);
% 
% % Point 5 to 6
% pp6 = transl(0.1,0.1,0);
% crt_sp5 = ctraj(pp5,pp6,po);
% crt_ik5  = R2.ikine(crt_sp5,'mask',[1 1 0 0 0 0]);
% 
% % Point 6 to 7
% pp7 = transl(-0.05,0.15,0);
% crt_sp6 = ctraj(pp6,pp7,po);
% crt_ik6  = R2.ikine(crt_sp6,'mask',[1 1 0 0 0 0]);
% 
% % Point 7 to 8
% pp8 = transl(0.05,0.15,0);
% crt_sp7 = ctraj(pp7,pp8,po);
% crt_ik7  = R2.ikine(crt_sp7,'mask',[1 1 0 0 0 0]);
% 
% % Point 8 to 9
% pp9 = transl(0.1,0.2,0);
% crt_sp8 = ctraj(pp8,pp9,po);
% crt_ik8  = R2.ikine(crt_sp8,'mask',[1 1 0 0 0 0]);
% 
% % Point 9 to 10
% pp10 = transl(0.1,0.1,0);
% crt_sp9 = ctraj(pp9,pp10,po);
% crt_ik9  = R2.ikine(crt_sp9,'mask',[1 1 0 0 0 0]);
% 
% % Point 10 to 11
% pp11 = transl(0.13,0.1,0);
% crt_sp10 = ctraj(pp10,pp11,po);
% crt_ik10  = R2.ikine(crt_sp10,'mask',[1 1 0 0 0 0]);
% 
% % Point 11 to 12
% pp12 = transl(0.13,0.2,0);
% crt_sp11 = ctraj(pp11,pp12,po);
% crt_ik11  = R2.ikine(crt_sp11,'mask',[1 1 0 0 0 0]);
% 
% % Point 12 to 13
% pp13 = transl(0.2,0.1,0);
% crt_sp12 = ctraj(pp12,pp13,po);
% crt_ik12  = R2.ikine(crt_sp12,'mask',[1 1 0 0 0 0]);
% 
% % Point 13 to 14
% pp14 = transl(0.2,0.2,0);
% crt_sp13 = ctraj(pp13,pp14,po);
% crt_ik13  = R2.ikine(crt_sp13,'mask',[1 1 0 0 0 0]);
% 
% %Perform Simulation and plot all the points
% for i=1:1:po
%     fd1=R2.fkine(crt_ik1(i,:));
%      j = transpose(fd1.t);
% %     k(i,:)= j;
%     plot2(j,'r.')    ;
%      R2.plot(crt_ik1(i,:)) ;
% end
% for i=1:1:po
%     fd2=R2.fkine(crt_ik2(i,:));
%      j = transpose(fd2.t);
% %     k(i,:)= j;
%     plot2(j,'r.')    ;
%      R2.plot(crt_ik2(i,:)) ;
% end
% for i=1:1:po
%     fd3=R2.fkine(crt_ik3(i,:));
%      j = transpose(fd3.t);
% %     k(i,:)= j;
%     plot2(j,'r.')    ;
%      R2.plot(crt_ik3(i,:)) ;
% end
% 
% for i=1:1:po
%     fd4=R2.fkine(crt_ik4(i,:));
%      j = transpose(fd4.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik4(i,:)) ;
% end
% 
% for i=1:1:po
%     fd5=R2.fkine(crt_ik5(i,:));
%      j = transpose(fd5.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik5(i,:)) ;
% end
% % 
% for i=1:1:po
%     fd6=R2.fkine(crt_ik6(i,:));
%      j = transpose(fd6.t);
% %     plot2(j,'r.');
%      R2.plot(crt_ik6(i,:));
% end
% % 
% for i=1:1:po
%     fd7=R2.fkine(crt_ik7(i,:));
%      j = transpose(fd7.t);
% %     k(i,:)= j;
%     plot2(j,'r.')    ;
%      R2.plot(crt_ik7(i,:)) ;
% end
% % 
% for i=1:1:po
%     fd8=R2.fkine(crt_ik8(i,:));
%      j = transpose(fd8.t);
% %     k(i,:)= j;
% %     plot2(j,'r.')    ;
%      R2.plot(crt_ik8(i,:)) ;
% end
% % 
% % 
% for i=1:1:po
%     fd9=R2.fkine(crt_ik9(i,:));
%      j = transpose(fd9.t);
% %     k(i,:)= j;
%     plot2(j,'r.')    ;
%      R2.plot(crt_ik9(i,:)) ;
% end
% 
% for i=1:1:po
%     fd10=R2.fkine(crt_ik10(i,:));
%      j = transpose(fd10.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik10(i,:)) ;
% end
% 
% for i=1:1:po
%     fd11=R2.fkine(crt_ik11(i,:));
%      j = transpose(fd11.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik11(i,:)) ;
% end
% for i=1:1:po
%     fd12=R2.fkine(crt_ik12(i,:));
%      j = transpose(fd12.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik12(i,:)) ;
% end
% 
% for i=1:1:po
%     fd13=R2.fkine(crt_ik13(i,:));
%      j = transpose(fd13.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik13(i,:)) ;
% end
% 
% 
% % hold on
% % R2.plot(crt_ik1)
% % R2.plot(crt_ik2)
% % R2.plot(crt_ik3)
% % R2.plot(crt_ik4)
% 
% % p1 = transl(0.1,0.02,0);
% % p2 = transl(0.2,0.02,0);
% % p3 = transl(0.2,0.2,0);
% % p4 = transl(0.1,0.2,0);
% % p5 = transl(0.1,0.02,0);
% 
% %  p0 = [0.05 0.4 0];
% %  p1 = transl(0.2,-0.1,0);
% %  p2 = transl(0.2,-0.2,0);
% %  p3 = transl(0.38,0.32,0);
% %  p4 = transl(0.020,0.380,0);
% %  p5 = transl(0.380,0.380,0);
% 
% 
% % 
% % % Plot the desired points
% % hold on 
% % %  start_point = p0;
% % %  plot2(start_point,'*') 
% %  
% %  point1 = p1';
% %  s1 = point1(4,1:3);
% %  plot2(s1,'r.') 
% %  
% %  point2 = p2';
% %  s2 = point2(4,1:3);
% %  plot2(s2,'r.')
% %  
% %  point3 = p3';
% %  s3 = point3(4,1:3);
% %  plot2(s3,'r.') 
% %  
% %  point4 = p4';
% %  s4 = point4(4,1:3);
% %  plot2(s4,'r.') 
% %  
% %  point5 = p5';
% %  s5 = point5(4,1:3);
% %  plot2(s5,'r.')
% %  plot2(s5,'*')
% % 
% % % performing inverse kinematics
% % q0 = [-0.6202    2.6226]
% % q1 = R2.ikine(p1,'mask',[1 1 0 0 0 0])
% % q2 = R2.ikine(p2,'mask',[1 1 0 0 0 0])
% % q3 = R2.ikine(p3,'mask',[1 1 0 0 0 0])
% % q4 = R2.ikine(p4,'mask',[1 1 0 0 0 0])
% % % q5 = R2.ikine(p5,'mask',[1 1 0 0 0 0])
% % 
% % % 
% % p = [q0; q1; q2; q3; q4]*180/pi
% 
% % a = p(1,1);
% % b = p(2,1);
% % c = p(3,1);
% % d = p(4,1);
% % e = p(5,1);
% % 
% % a1 = p(1,2);
% % b1 = p(2,2);
% % c1 = p(3,2);
% % d1 = p(4,2);
% % e1 = p(5,2);
% % 
% % if (a<0)
% %     a = -a;
% % end
% % 
% % if (b<0)
% %     b = -b;
% % end
% % 
% % if (c<0)
% %     c = -c;
% % end
% % 
% % if (d<0)
% %     d = -d;
% % end
% % 
% % if (e<0)
% %     e = -e;
% % end
% % 
% % if (a1<0)
% %     a1 = -a1;
% % end
% % 
% % if (b1<0)
% %     b1 = -b1;
% % end
% % 
% % if (c1<0)
% %     c1 = -c1;
% % end
% % 
% % if (d1<0)
% %     d1 = -d1;
% % end
% % 
% % if (e1<0)
% %     e1 = -e1;
% % end
% % % 
% % % 
% % % 
% % theta1 = a
% % theta2 = b
% % theta3 = c
% % theta4 = d
% % theta5 = e
% % 
% % theta1a = a1
% % theta2a = b1
% % theta3a = c1
% % theta4a = d1
% % theta5a = e1
% % 
% % qq1 = [theta1 theta1a]
% % qq2 = [theta2 theta2a]
% 
% % l1 = 0.20;
% % l2 = 0.15;
% % 
% % x = 0.2;
% % y = 0.08;
% % q22 = acos((x^2+y^2-l1^2-l2^2)/(2*l1*l2))
% % q11 = atan(y/x) - atan(l2*sin(q22))/(l1+(l2*cos(q22)))
% 
% 
% % c = ctraj(p1,p2,10);
% % traj0=jtraj(q1,q2,10);
% 
% % %
% % % % Time vector & steps
% % t=0:.03:2;   
% % traj0=jtraj(q0,q1,t);
% % traj1=jtraj(q1,q2,t);
% % traj2=jtraj(q2,q3,t); 
% % traj3=jtraj(q3,q4,t);
% % traj4=jtraj(q4,q0,t);
% % traj5=jtraj(q5,q0,t);
% 
% % t1 = 0:1:10;
% % traj6 = jtraj(q0,q1,t1);
% % tt = traj6(:,2)*(180/pi)
% % 
% % traj6 = jtraj(q1,q2,t1);
% % tt1 = traj6(:,2)*(180/pi)
% % 
% % traj6 = jtraj(q2,q0,t1);
% % tt2 = traj6(:,2)*(180/pi)
% % 
% % f = tpoly(p(1,2),p(5,2),50)
% 
% 
% % 
% % traj7 = jtraj(d1,a1,t1);
% % % traj5=jtraj(q5,q0,t);
% % % 
% % % performing Forward kinematics and Simulation
% 
% % for i=1:1:67 
% %     fd0=R2.fkine(traj0(i,:));
% %     j = transpose(fd0.t);
% %     k(i,:)= j;
% %     plot2(j,'r.')    
% %     R2.plot(traj0(i,:));
% % end
% % 
% % for i=1:1:67 
% %     fd1=R2.fkine(traj1(i,:));
% %     j = transpose(fd1.t);
% %     k(i,:)= j;
% %     plot2(j,'r.')    
% %     R2.plot(traj1(i,:)) 
% % end
% % 
% % for i=1:1:67 
% %     fd2=R2.fkine(traj2(i,:));
% %     j = transpose(fd2.t);
% %     k(i,:)= j;
% %     plot2(j,'r.')    
% %     R2.plot(traj2(i,:)) 
% % end
% % % 
% % for i=1:1:67 
% %     fd3=R2.fkine(traj3(i,:));
% %     j = transpose(fd3.t);
% %     k(i,:)= j;
% %     plot2(j,'r.')    
% %     R2.plot(traj3(i,:)) 
% % end
% % % 
% % for i=1:1:67 
% %     fd4=R2.fkine(traj4(i,:));
% %     j = transpose(fd4.t);
% %     k(i,:)= j;
% %     plot2(j,'r.')    
% %     R2.plot(traj4(i,:)) 
% % end
% % for i=1:1:67 
% %     fd5=R2.fkine(traj5(i,:));
% %     j = transpose(fd5.t);
% %     k(i,:)= j;
% %     plot2(j,'r.')    
% %     R2.plot(traj5(i,:)) 
% % end
% 
