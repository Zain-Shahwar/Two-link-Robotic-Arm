
%            theta    d     a      alpha     R/P  offset

L(1) = Link([0      0      .2        0          0      0  ]);%a=0.500
L(2) = Link([0      0      0.1       0          0      0]);

% dh = [0 0 0 2 0
%       0 0 0 1 0]


R2 = SerialLink(L(1:2), 'name', 'Two_Link')
hold on 
% atj=zeros(0.4,0.4); 
view(-0.6,0.6);
xlim([-0.6,0.6]);
ylim([-0.6,0.6]); 
zlim([-0.1,0.1]); 

q0=[0 0]; 
q1=[pi/2 0]; 
q2=[pi pi/2]; 
q3=[pi/2 pi/3]; 
q4=[pi/2 0]; 

t=0:.03:2;  %Time vector & steps 
traj0=jtraj(q0,q1,t); 
traj1=jtraj(q1,q2,t);  
traj2=jtraj(q2,q3,t); 
traj3=jtraj(q3,q4,t);
traj4=jtraj(q4,q0,t); 

for i=1:1:67 
    atj=R2.fkine(traj0(i,:));
    jta=transpose(atj); 
    JTA(i,:)=jta(4,1:3);
    jta=JTA; 
    plot2(jta(i,:),'r.') 
    R2.plot(traj0(i,:)) 
%     plot2(JTA,'b') 
end
for i=1:1:67 
    atj=R2.fkine(traj1(i,:));
    jta=transpose(atj); 
    JTA(i,:)=jta(4,1:3);
    jta=JTA; 
    plot2(jta(i,:),'r.') 
    R2.plot(traj1(i,:)) 
%     plot2(JTA,'b') 
end
for i=1:1:67 
    atj=R2.fkine(traj2(i,:));
    jta=transpose(atj); 
    JTA(i,:)=jta(4,1:3);
    jta=JTA; 
    plot2(jta(i,:),'r.') 
    R2.plot(traj2(i,:)) 
%     plot2(JTA,'b') 
end
for i=1:1:67 
    atj=R2.fkine(traj3(i,:));
    jta=transpose(atj); 
    JTA(i,:)=jta(4,1:3);
    jta=JTA; 
    plot2(jta(i,:),'r.') 
    R2.plot(traj3(i,:)) 
%     plot2(JTA,'b') 
end
for i=1:1:67 
    atj=R2.fkine(traj4(i,:));
    jta=transpose(atj); 
    JTA(i,:)=jta(4,1:3);
    jta=JTA; 
    plot2(jta(i,:),'r.') 
    R2.plot(traj4(i,:)) 
%     plot2(JTA,'b') 
end
% R2.plot([0 pi/2])